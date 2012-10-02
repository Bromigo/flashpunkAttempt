package{
	import net.flashpunk.Entity; //for Player class to extend
	import net.flashpunk.FP; //to access various stuff
	import net.flashpunk.utils.Input; //for movement
	
	import net.flashpunk.graphics.Image; //to create Image
	import net.flashpunk.masks.Pixelmask; //to create Pixelmask
	import flash.display.BitmapData;  //to create BitmapData
	import flash.geom.Point; //to create Point
	
	
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
			x=400;
			y=300;
			
			img = new Image(GC.GFX_PLAYER);
			
			img.originX=offset.x;
			img.originY=offset.y;
			
			//size is the maximum size of the outer hitbox that the pixelmask fits into
			var size:int=Math.ceil(Math.sqrt(img.width * img.width + img.height * img.height));
			//the following lines create the pixelmap
			maskBmp = new BitmapData(size, size, true, 0);
			maskObj = new Pixelmask(maskBmp, -offset.x, -offset.y);
			//unkown what next line does. appears to work when it is commented out. but what the hell, i'll keep it
			img.render(maskBmp,offset,FP.zero);
			//draw image to screen, and apply mask
			super(x,y,img,maskObj);
			
			collidable= true;
		}
		
		override public function update():void{
			angleDeg=FP.angle(x, y, Input.mouseX, Input.mouseY);
			face_mouse(angleDeg);
			//movement
			if( Input.check("forward")||Input.check("back")
		      ||Input.check("right")  ||Input.check("left")){
				move();
			}
			//M1 (fire)
			if (Input.mousePressed){
				fire();
			}
			
		}
		
			
		public function face_mouse(degrees:Number):void {
			img.angle = degrees;
			maskBmp.fillRect(maskBmp.rect,0);
			FP.point.x=offset.x;
			FP.point.y=offset.y;
			img.render(maskBmp,FP.point,FP.zero);
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