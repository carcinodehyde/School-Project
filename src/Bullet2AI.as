package  
{
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class Bullet2AI extends EnemyAI 
	{
		private var moveSpeed:int = 50;
		private var DeltaShot:Number = 0.2;
		private var timeToDeltaShot:Number = 0;
		
		private var i:Number = 0;
		private var time:Number = 0;
		
		public function Bullet2AI() 
		{
			
		}
		
		override public function update(elapsedTime:Number):void
		{
			super.update(elapsedTime);
			
			i += 10;
			
			if (actor.y < FP.camera.y + (FP.height - 420))
			{
				actor.y += moveSpeed * elapsedTime;
				
			}
			else
			{
				actor.y -= moveSpeed * elapsedTime;
			}
			
			time += elapsedTime;
			timeToDeltaShot += elapsedTime;
			
			if (timeToDeltaShot > DeltaShot)
			{
				shoot();
				timeToDeltaShot -= DeltaShot;
			}
		}
		
		private function shoot():void
		{
			if (time < 3)
			{
				
				var peluru1:Bullet = new Bullet(AssetsList.PELURU1, actor.x,
				actor.y + 15, i, 500, 210, "player");
				peluru1.attackPower = 20;
				if (actor.world != null)
				{
					actor.world.add(peluru1);
				}
			}
			
			if (time > 6)
			{
				i = 0;
				time = 0;
			}
		}
	}

}