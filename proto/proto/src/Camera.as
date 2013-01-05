package{
	import net.flashpunk.FP;
	
	public class Camera{
		private static var lastAngle:Number = 0;
		
		public static function update(angleD:Number,pX:Number,pY:Number):void{
			var angleRad:Number;
			var oX:Number;
			var oY:Number;
			
			angleRad = angleD*Math.PI/180 *-1;
			oX = 280 * Math.cos(angleRad) + pX;
			oY = 280 * Math.sin(angleRad) + pY;
			
			FP.camera.x = oX -300;
			FP.camera.y = oY -300;
		}
		
	}
}