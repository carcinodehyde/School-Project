package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class GameOver extends World 
	{
		private var over:Backdrop = new Backdrop(AssetsList.gOver);
		
		
		public function GameOver() 
		{
			Text.font = "sysFont";
			Text.size = 45;
			var j:int = headUp.point;
			var total:Entity = new Entity;
			var d:Text = new Text("Your Score is	" + j, 125, 262);
			d.color = 0x00000;
			total.graphic = d;
			total.layer = 90;
			
			add(total);
			
			var Over:Entity = new Entity;
			Over.graphic = over;
			Over.layer = 100;
			add(Over);
			
		}
		
		override public function update():void
		{
			
			if (Input.check(Key.SPACE))
			{
				FP.world = new MapMenu;
				reset();
			}
		}
		
		private function reset():void
		{
			Character.sisaNyawa = 4;
			headUp.point = 0;
			Character.alp = 100;
		}
	}

}