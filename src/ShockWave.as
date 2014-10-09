package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class ShockWave extends Entity 
	{
		[Embed(source = "../assets/shockwave.png")]
		private static const shock:Class;
		
		private var img:Spritemap;
		
		public function ShockWave(x:int, y:int) 
		{
			img = new Spritemap(shock, 32, 32, endWave);
			
			graphic = img;
			img.centerOO();
			
			img.add("shock", [0, 1, 2, 3, 4, 5, 6, 7, 8], 2, false);
			
			img.play("shock")
			
			
			this.x = x;
			this.y = y;
			
			
		}
		
		private function endWave():void
		{
			this.world.remove(this);
		}
		
	}

}