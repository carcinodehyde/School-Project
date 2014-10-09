package  
{
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class BasicAI extends EnemyAI 
	{
		private var jalan:int = 0;
		private var moveSpeed:int = 50;
		private var deltaShot:Number = 1;
		private var timeToDeltaShot:Number = 0;
		
		private var diagSpeed:int = 2;
		
		public function BasicAI(player:Character) 
		{
			this.player = player;
			
			
		}
		
		override public function update(elapsedTime:Number):void
		{
			
			super.update(elapsedTime);
			
			trace("x aktor " + actor.x);
			actor.x += diagSpeed;
			if (actor.x > 410)
			{
				diagSpeed = -2;
			}
			else if (actor.x < 0)
			{
				diagSpeed = 2;
			}
			
			//actor.y += 2;
			
			
			
			/*
			if (actor.y < FP.camera.y + (FP.height - 400))
			{
				actor.y += moveSpeed * elapsedTime;
				
			}
			else
			{
				actor.y -= moveSpeed * elapsedTime;
			}
			*/
			
			timeToDeltaShot += elapsedTime;
			if (timeToDeltaShot >= deltaShot)
			{
				shoot(player);
				timeToDeltaShot -= deltaShot;
			}
			
			/*
			if (actor.y > 480)
			{
				//actor.world.remove(actor);
				
				//COBA _ COBA
				
				jalan++;
				actor.y = 0;
				if (jalan % 2 == 0)
				{
					actor.x = 100;
					trace(jalan);
				}
				else if (jalan % 2 == 1)
				{
					actor.x = 500;
					trace(jalan);
				}
			}
			*/
		}
		
		private function shoot(target:Character):void
		{
			if (actor.world != null)
			{
				var peluru:Bullet = new Bullet(AssetsList.PELURU1, actor.x, actor.y, FP.camera.x + target.x, target.y, 290, "player");
				peluru.attackPower = 22;
				actor.world.add(peluru);
			}
		}
	}

}