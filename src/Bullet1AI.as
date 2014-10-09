package  
{
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class Bullet1AI extends EnemyAI 
	{
		private var moveSpeed:int = 50;
		private var DeltaShot:Number = 0.7;
		private var timeToDeltaShot:Number = 0;
		
		private var time:Number = 0;
		
		
		public function Bullet1AI() 
		{
			
		}
		
		override public function update(elapsedTime:Number):void
		{
			super.update(elapsedTime);
			
			
			time += elapsedTime;
			
			if (actor.y < FP.camera.y + (FP.height - 420))
			{
				actor.y += moveSpeed * elapsedTime;
				
			}
			else
			{
				actor.y -= moveSpeed * elapsedTime;
			}
			
			timeToDeltaShot += elapsedTime;
			if (timeToDeltaShot > DeltaShot)
			{
				shoot();
				timeToDeltaShot -= DeltaShot;
			}
		}
		
		private function shoot():void
		{
			if (time < 4)
			{
			
				for (var i:int = -200; i <= 120; i += 40)
				{
					
					var peluru:Bullet = 
					new Bullet(AssetsList.PELURU1, actor.x, actor.y + 20, actor.x + (i * 30), 500, 80, "player");
					peluru.attackPower = 27;
					if (actor.world != null)
					{
						actor.world.add(peluru);
					}
					
				}
			}
			if (time > 8)
			{
				time = 0;
			}
		}
		
	}

}