package 
{
	import net.flashpunk.Engine; //main flashpunk engine
	import net.flashpunk.FP; //flashpunk utilities	
	import flash.system.Capabilities; //to check for debug mode
	
	[SWF(width = "600", height = "600")]
	public class Main extends Engine {
		
		public function Main():void {
			super(600, 600, 60, false);
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