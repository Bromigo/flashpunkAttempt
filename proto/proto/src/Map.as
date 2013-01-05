package{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class Map extends Entity{
		
		public function Map(){
			graphic = new Image(GC.BG_TILE);
			layer = 10;
		}
	}
}