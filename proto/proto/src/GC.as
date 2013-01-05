package 
{
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class GC {
		//GFX
		[Embed(source = '/../assets/man1.png')] public static const GFX_PLAYER:Class;
		[Embed(source = '/../assets/bullet.png')] public static const GFX_BULLET:Class;
		[Embed(source = '/../assets/bg_tile.png')] public static const BG_TILE:Class;
		
		//INPUT KEYS
		Input.define("forward", Key.UP, Key.W);
		Input.define("back", Key.DOWN, Key.S);
		Input.define("left", Key.LEFT, Key.A);
		Input.define("right", Key.RIGHT, Key.D);
	
	}	
}