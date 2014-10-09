package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class Tiles extends Entity 
	{
		public var img:Tilemap;
		public function Tiles(tileset:*) 
		{
			img = new Tilemap(tileset, 640, 1440, 32, 32);
			
			graphic = img;
			
		}
		
	}

}