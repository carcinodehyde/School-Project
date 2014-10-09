package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.Sfx;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class MapMenu extends World 
	{
		private var judul:Backdrop = new Backdrop(AssetsList.JUDUL, true, true);
		
		private var mulai:start = new start(AssetsList.startw);
		
		private var exi:exit = new exit(AssetsList.exitIm);
		
		public static var musik:Sfx = new Sfx(AssetsList.voile);
		
		private var crdb:crdbtn = new crdbtn(AssetsList.credbtn);
		
		private var runOnce:int = 1;
		
		public static const decision:Sfx = new Sfx(AssetsList.decis);
		
		public function MapMenu() 
		{
			musik.loop(0.7);
		
			var jud:Entity = new Entity;
			jud.graphic = judul;
			jud.layer = 100;
			add(jud);
			
			mulai.x = 480;
			mulai.y = 207;
			add(mulai);
			
			exi.x = 490;
			exi.y = 350;
			add(exi);
			
			crdb.x = 480;
			crdb.y = 280;
			add(crdb);
			
		}
		
		
	}

}