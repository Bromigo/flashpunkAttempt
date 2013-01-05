package {
	import net.flashpunk.World;

	
	public class DebugWorld extends World{
		public static var WIDTH:int;
		public static var HEIGHT:int;
		
		public function DebugWorld(){
			add(new Map);
			add(new Player);
		}
	}
}