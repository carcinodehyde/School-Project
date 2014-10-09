package  
{
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class EnemyAI 
	{
		public var player:Character;
		public var actor:Enemy;
		
		public function EnemyAI() 
		{
			
		}
		
		public function update(elapsedTime:Number):void
		{
			if (actor.y > FP.camera.y + FP.bounds.height)
			{
				actor.world.remove(actor);
			}
			
		}
	}

}