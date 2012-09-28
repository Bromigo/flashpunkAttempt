package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class Main extends Engine {
		
		public function Main():void {
			super(800, 600, 60, false);
			//enable debug console (toggle w/ ~)
			FP.console.enable();
		}
		
		override public function init():void {
			trace("Flashpunk started");
			FP.world = new DebugWorld;
		}
	}
}