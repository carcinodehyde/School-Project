package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class Explosion extends Entity 
	{
		[Embed(source = "../assets/exp2_0.png")]
		private static const EXPLOSION:Class;
		
		private var img:Spritemap;
		
		public function Explosion(x:int, y:int) 
		{
			img = new Spritemap(EXPLOSION, 64, 64, endExplosion);
			graphic = img;
			img.add("Explode",
			[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 20, false);
			img.play("Explode");
			
			this.x = x;
			
			this.y = y;
			
			
		}
		
		private function endExplosion():void
		{
			this.world.remove(this);
		}
		
	}

}