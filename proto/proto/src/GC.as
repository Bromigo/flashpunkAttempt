package 
{
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class GC {
		//GFX
		[Embed(source = '/../assets/man0.png')] public static const GFX_PLAYER:Class;
		
		//INPUT KEYS - these become global. don't need to use, for example, 'GC.forward'. just "forward" 
		Input.define("forward", Key.UP, Key.W);
		Input.define("back", Key.DOWN, Key.S);
		Input.define("left", Key.LEFT, Key.A);
		Input.define("right", Key.RIGHT, Key.D);

	}	
}