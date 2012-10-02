//WIP
//Eventually will become superclass for different bullet types.

package{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image; //to create Image
	import net.flashpunk.masks.Pixelmask; //to create Pixelmask
	import flash.display.BitmapData;  //to create BitmapData
	import flash.geom.Point; //to create Point
	import net.flashpunk.FP; //to access various stuff
	
	public class Bullet extends Entity{
		
		private var img:Image;
		private var maskBmp:BitmapData;
		private var maskObj:Pixelmask;
		
		private var offset:Point = new Point(4,4);

		private var angleDeg:Number;
		private var angleRad:Number;
		private var speed:Number;
		
		
		//constructor
		public function Bullet(x:int,y:int,dir:Number,sp:Number){
			angleDeg=dir;
			angleRad=dir *Math.PI/180;
			speed=sp;
			
			img = new Image(GC.GFX_BULLET);
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
			move();
		}
		
		private function move():void{
				x -= speed * Math.cos(angleRad) * -1;
				y += speed * Math.sin(angleRad) * -1;			
		}
		
		
		
	}
}