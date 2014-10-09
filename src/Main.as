package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class Main extends Engine 
	{
		
		public function Main():void 
		{
			super(640, 480, 30, false);
			FP.world = new splashScreen();
			//FP.world = new Splash;
			//FP.world = new MapOne;
			//FP.world = new GameOver;
			//FP.console.enable();
		}
		
		override public function init():void 
		{
			trace("flashpunk versi " + FP.VERSION);
			
		}
		
	}
	
}