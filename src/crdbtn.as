package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class crdbtn extends Entity 
	{
		private var imj:Spritemap;
		
		public function crdbtn(sprite:*) 
		{
			imj = new Spritemap(sprite, 146, 28);
			imj.add("play", [0, 1], 10, false);
			imj.add("idle", [0], 1, false);
			
			graphic = imj;
			
		}
		
		override public function update():void
		{
			
			
			if (Input.mouseX >= 480 && Input.mouseX <= 624 && Input.mouseY >= 280 && Input.mouseY <= 300)
			{
				imj.play("play");
				if (Input.mouseReleased)
				{
					MapMenu.decision.play(0.5);
					MapMenu.musik.stop();
					FP.world = new Credit;
				}
			}
			else
			{
				imj.play("idle");
			}
		}
		
	}

}