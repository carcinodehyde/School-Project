package  
{
	import net.flashpunk.World;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class Credit extends World 
	{
		private var bg:Backdrop = new Backdrop(AssetsList.credit, true, true);
		private var tulis:Image = new Image(AssetsList.tulisan);
		private var cred_ex:Image = new Image(AssetsList.exit_c);
		
		private var tls:Entity = new Entity;
		
		private var muzik:Sfx = new Sfx(AssetsList.end);
		
		public function Credit() 
		{
			muzik.loop();
			
			var BG:Entity = new Entity;
			BG.graphic = bg;
			BG.layer = 10;
			
			add(BG);
			
			
			tls.graphic = tulis;
			tls.layer = 9;
			tls.y = 480;
			tls.x = 30;
			
			
			add(tls);
			
			var exx:Entity = new Entity;
			exx.graphic = cred_ex;
			exx.layer = 8;
			
			add(exx);
		}
		
		
		override public function update():void
		{
			
			tls.y -= 1;
			
			if (tls.y <= -800)
			{
				tls.y = 480;
			}
			
			Input.define("exit", Key.Z, Key.ENTER, Key.ESCAPE, Key.SPACE);
			
			if (Input.check("exit"))
			{
				muzik.stop();
				
				FP.world = new MapMenu;
			}
		}
		
		
	}

}