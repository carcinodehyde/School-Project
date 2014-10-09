package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import Explosion;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class Bullet extends Entity 
	{
		public var attacks:String;
		
		private var xTarget:Number;
		
		private var yTarget:Number;
		
		public var tempPoint:int = 10;
		
		//---
		public var attackPower:Number;
		
		private var xSpeed:Number;
		
		private var ySpeed:Number;
		
		private var img:Image;
		
		private var timeToAlp:int = 4;
		
		public static var dest:Boolean = false;
		
		private var damageFx:Sfx = new Sfx(AssetsList.damageSfx);
		
		//SFX
		private var ExploSfx:Sfx = new Sfx(AssetsList.explosionSfx);
		
		public function Bullet(sprite:*, startingX:int, startingY:int, xTarget:Number, yTarget:Number, moveSpeed:int = 250, attacks:String = "enemy") 
		{
			
			
			x = startingX;
			y = startingY;
			
			this.xTarget = xTarget;
			this.yTarget = yTarget;
			img = new Image(sprite);
			img.centerOO();
			graphic = img;
			
			var yDist:Number = yTarget - y;
			var xDist:Number = xTarget - x;
			var angle:Number = Math.atan2(yDist, xDist);
			xSpeed = Math.cos(angle) * moveSpeed;
			ySpeed = Math.sin(angle) * moveSpeed;
			
			setHitbox(12, 12);
			this.centerOrigin();
			type = "peluru";
			this.attacks = attacks;
		}
		
		override public function update():void
        {
			
			
			
			timeToAlp -= FP.elapsed;
			if (timeToAlp == 0)
			{
				if (Character.health == 0)
				{
					Character.alp = 50;
					Character.isColliadble = false;
				}
			}
			Character.alp = 100;
			Character.isColliadble = true;
			
            x += xSpeed * FP.elapsed;
            y += ySpeed * FP.elapsed;
 
            
			
			if (y < FP.camera.y || y > FP.camera.y + FP.bounds.height) 
			{
				FP.world.recycle(this);
			}
			if (x > 410 || x < 0)
			{
				FP.world.recycle(this);
			}
			
			
			
			
            if (attacks == "enemy")
            {
                var musuh:Enemy = collide("musuh", x, y) as Enemy;
                
				if (musuh)
                {
					//ledak(pemain.x, pemain.y);
					var ldk:Explosion = new Explosion(musuh.x, musuh.y);
					
					if (world != null)
							{
								
								ExploSfx.play();
								
								upPoint();
								//trace(tempPoint);
								this.world.add(ldk);
								this.world.recycle(musuh);
								this.world.recycle(this);
							
							//untuk debug
							//this.world.add(musuh);
							}
					/*
					musuh.health -= attackPower;
                    
					if (musuh.health <= 0)
                    {
							
                    }
					*/
					
					
                }
				
            }
            else if (attacks == "player")
            {
                var pemain:Character = collide("pemain", x, y) as Character;
                
				if (pemain)
                {
					//ledak(pemain.x, pemain.y);
					var ldk2:Explosion = new Explosion(pemain.x, pemain.y);
					
					damageFx.play(0.4);
                    Character.health -= attackPower;
                    if (Character.health <= 0)
                    {
						   if (world != null)
							{
								
								this.world.add(ldk2);
								
								ExploSfx.play();
								
								playerDestroy();
								//untuk debug
								//respawn();
								
								pemain.x = 183;
								pemain.y = FP.camera.y + 500;
								
								if (dest == false)
								{
									dest = true;
								
								}
								
									
									
							}
                    }
					this.world.remove(this);
					
					
					
                 }
            }
        }
		
		
		private function upPoint():void
		{
			headUp.point += tempPoint;
		}
		
		
		
		private function playerDestroy():void
		{
			Character.sisaNyawa--;
			Character.health = 500;
		
			
			
			
		}
		
		private function respawn():void
		{
			//timeToAlp -= FP.elapsed;
			
		}
		
		
	}

}