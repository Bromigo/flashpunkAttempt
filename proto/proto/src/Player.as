package{
	import net.flashpunk.Entity; //for Player class to extend
	import net.flashpunk.FP; //to access various stuff
	import net.flashpunk.utils.Input; //for movement
	
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	
	public class Player extends Entity{
		//gfx
		private var img:Image;
		private var offset:Point = new Point(25,18);
		//mask
		private var maskBmp:BitmapData;
		private var maskObj:Pixelmask;
		
		//angle from mouse (orientation angle)
		private var angleDeg:Number=0; 
		private var angleRad:Number=0;
		
		//movement
		private var walkSpeed:Number=4;

		//Constructor function
		public function Player(){
			collidable = true;
			layer = 1;
			//start position
			x=400;
			y=300;
			
			img = new Image(GC.GFX_PLAYER);
			
			//set origin point to center of player's head
			img.originX=offset.x;
			img.originY=offset.y;
			
			/* Mask code
				//size is the maximum size of the outer hitbox that the pixelmask fits into
				var size:int=Math.ceil(Math.sqrt(img.width * img.width + img.height * img.height));
				
				//the following lines create the pixelmap
				maskBmp = new BitmapData(size, size, true, 0);
				maskObj = new Pixelmask(maskBmp, -offset.x, -offset.y);

				//draw image to screen, and apply mask
				super(x,y,img,maskObj);
			*/
			super(x,y,img);
		}
		
		override public function update():void{
			//angleDeg=FP.angle(x, y, Input.mouseX+FP.camera.x, Input.mouseY+FP.camera.y);
			face_mouse();
			//movement
			if( Input.check("forward")||Input.check("back")
		      ||Input.check("right")  ||Input.check("left")){
				move();
			}
			
			Camera.update(angleDeg,x,y);
			
			//M1 (fire)
			if (Input.mousePressed){
				fire();
			}
			
		}
		
			
		public function face_mouse():void {
			//determine angle
			angleDeg=FP.angle(x, y, Input.mouseX+FP.camera.x, Input.mouseY+FP.camera.y);
			//rotate image
			img.angle = angleDeg;
			
			/* The following is tied to the MASK
				maskBmp.fillRect(maskBmp.rect,0);
				FP.point.x=offset.x;
				FP.point.y=offset.y;
				img.render(maskBmp,FP.point,FP.zero);
			*/
		}
		
		public function move():void{
			if (Input.check("forward")) {
				angleRad = angleDeg * Math.PI / 180;
				x -= walkSpeed * Math.cos(angleRad) * -1;
				y += walkSpeed * Math.sin(angleRad) * -1;
			}
			else if (Input.check("back")) {
				angleRad = angleDeg * Math.PI / 180;
				x += (walkSpeed*2/3) * Math.cos(angleRad) * -1;
				y -= (walkSpeed*2/3) * Math.sin(angleRad) * -1;
			}
			else if (Input.check("right")) {
				angleRad = (angleDeg - 90) * Math.PI / 180;
				x -= (walkSpeed*2/3) * Math.cos(angleRad) * -1;
				y += (walkSpeed*2/3) * Math.sin(angleRad) * -1;
			}
			else if (Input.check("left")) {
				angleRad = (angleDeg +90) * Math.PI / 180;
				x -= (walkSpeed*2/3) * Math.cos(angleRad) * -1;
				y += (walkSpeed*2/3) * Math.sin(angleRad) * -1;				
			}
		}
		
		private function fire():void{
			//determine x,y,angle,speed (18 is distance from origin to gun's end)
			angleRad = angleDeg * Math.PI /180;
			var _x:Number = x - 19 * Math.cos(angleRad) * -1;
			var _y:Number = y + 19 * Math.sin(angleRad) * -1;
			
			
			FP.world.add(new Bullet(_x,_y,angleDeg,80)); //the 80 is currently bullet vel
		}
		
	}
}