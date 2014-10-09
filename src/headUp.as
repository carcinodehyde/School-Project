package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class headUp extends Entity 
	{
		private var imaje:Image;
		private var e:Entity = new Entity;
		public static var point:int = 0;
		
		private var nyowo:Spritemap;
		public static var nyawa1:Entity = new Entity;
		public static var nyawa2:Entity = new Entity;
		public static var nyawa3:Entity = new Entity;
		private var d:Entity = new Entity;
		
		private var runOnce:int = 1;
		
		public function headUp(sprite:*) 
		{
			imaje = new Image(sprite);
			
			imaje.scrollX = 0;
			imaje.scrollY = 0;
			
			graphic = imaje;
			
			Text.font = "sysFont";
			Text.size = 24;
			
			//NYAWA
			nyowo = new Spritemap(AssetsList.nyawa, 43, 43);
			nyowo.add("idle", [0], 1, false);
			nyowo.add("mati", [1, 2, 3, 4], 6, false);
			
			
			//nyowo.x = 430;
			//nyowo.y = 90;
			nyowo.scrollY = 0;
		}
		
		override public function update():void
		{
			
			
			var poin:Text = new Text(point.toString(), 530, 41);
			poin.scrollX = 0;
			poin.scrollY = 0;
			
			e.graphic = poin;
			
			var hel:Text = new Text(Character.health.toString(), 530, 63);
			
			
			hel.scrollY = 0;
			d.graphic = hel;
			
			world.add(d);
			
			world.add(e);
			if (runOnce == 1)
			{
				for (var i:int = 0; i <= 45; i += 15)
				{
					nyawa1.graphic = nyowo;
					nyawa2.graphic = nyowo;
					nyawa3.graphic = nyowo;
					
					nyawa1.x = 430;
					nyawa1.y = 95;
					nyawa2.x = 430 + i;
					nyawa2.y = 95;
					nyawa3.x = 430 + (2 * i);
					nyawa3.y = 95;
					
					world.add(nyawa1);
					world.add(nyawa2);
					world.add(nyawa3);
				}
			runOnce--;
			}
			
			if (Character.sisaNyawa == 3)
			{
				world.recycle(nyawa3);
			}
			else if (Character.sisaNyawa == 2)
			{
				world.recycle(nyawa2);
			}
			else if(Character.sisaNyawa == 1)
			{
				world.recycle(nyawa1);
			}
			
		}
		
	}

}