package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import flash.system.fscommand;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class exit extends Entity 
	{
		private var eksi:Spritemap;
		
		public function exit(sprite:*) 
		{
			eksi = new Spritemap(sprite, 116, 23);
			eksi.add("pure", [0, 1], 10, false);
			eksi.add("idle", [0], 1, false);
			
			graphic = eksi;
		}
		
		override public function update():void
		{
			if (Input.mouseX >= 490 && Input.mouseX <= 605 && Input.mouseY >= 350 && Input.mouseY <= 374)
			{
				
				eksi.play("pure");
				if (Input.mouseReleased)
				{
					MapMenu.decision.play(0.5);
					fscommand("quit");
				}
			}
			else
			{
				eksi.play("idle");
			}
		}
		
	}

}