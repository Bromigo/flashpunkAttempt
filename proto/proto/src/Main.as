package 
{
	import net.flashpunk.Engine; //main flashpunk engine
	import net.flashpunk.FP; //flashpunk utilities	
	import flash.system.Capabilities; //to check for debug mode
	
	public class Main extends Engine {
		
		public function Main():void {
			super(800, 600, 60, false);
			if(Capabilities.isDebugger){
				//enable debug console (toggle w/ ~)
				FP.console.enable();
			}
		}
		
		override public function init():void {
			trace("Flashpunk started");
			FP.world = new DebugWorld;
		}
	}
}