package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class start extends Entity 
	{
		private var sutar:Spritemap;
		
		public function start(sprite:*) 
		{
			sutar = new Spritemap(sprite, 146, 28);
			sutar.add("str", [0, 1], 10, false);
			sutar.add("idle", [0], 1, false);
			graphic = sutar;
		}
		
		override public function update():void
		{
			if (Input.mouseX >= 480 && Input.mouseX <= 624 && Input.mouseY >= 205 && Input.mouseY <= 231)
			{
				
				
				sutar.play("str");
				if (Input.mousePressed)
				{
					MapMenu.decision.play(0.5);
					MapMenu.musik.stop();
					FP.world = new petunjuk;
				}
			}
			else
			{
				sutar.play("idle");
			}
			
			
		}
		
	}

}