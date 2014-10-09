package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class petunjuk extends World 
	{
		private var bg:Backdrop = new Backdrop(AssetsList.petunjuk_g);
		
		public function petunjuk() 
		{
			var e:Entity = new Entity;
			e.graphic = bg;
			add(e);
			
		}
		
		override public function update():void
		{
			if (Input.check(Key.Z))
			{
				FP.world = new MapOne;
			}
			
		}
		
	}

}