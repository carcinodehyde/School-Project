package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class splashScreen extends World 
	{
		private var bg:Backdrop = new Backdrop(AssetsList.splash_bg);
		private var txt:Image = new Image(AssetsList.splash_txt);
		
		public function splashScreen() 
		{
			var e:Entity = new Entity;
			e.graphic = bg;
			e.layer = 10;
			add(e);
			
			var tx:Entity = new Entity;
			tx.graphic = txt;
			tx.layer = 9;
			txt.alpha = 0;
			add(tx);
			
		}
		
		override public function update():void
		{
			
			txt.alpha += 0.15 * FP.elapsed;
			
			//trace(txt.alpha);
			if ((txt.alpha == 1) || (Input.check(Key.Z))) 
			{
				FP.world = new MapMenu;
			}
			
		}
		
	}

}