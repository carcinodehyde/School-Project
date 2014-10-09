package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class Character extends Entity 
	{
		
		//STATUS
		public static var health:Number;
		public var power:Number = 30;
		public var shield:Number;
		
		//deltaShot and time
		private var deltaShot:Number = 0.5;
		private var timeToDeltaShot:Number = 0;
		
		//penampung gambar
		public static var img:Image;
		
		//kecepatan gerak
		public var speed:int = 160;
		
		//isCollidable
		public static var alp:int = 100;
		public var timeToAlp:int = 4;
		public static var isColliadble:Boolean = true;
		
		public static var sisaNyawa:int = 4;
		
		//SFX
		private var playerSfx:Sfx = new Sfx(AssetsList.shootSfx);
		
		public function Character(sprite:*) 
		{
			img = new Image(sprite);
			img.centerOO();
			
			graphic = img;
			
			this.collidable = isColliadble;
			//SET HITBOX
			
			setHitbox(15, 15);
			this.centerOrigin();
			type = "pemain";
			
			img.alpha = alp;
			
			
			img.scrollX = 1;
			img.scrollY = 1;
			
			
			
		}
		
		override public function update():void
		{
			trace(Character.sisaNyawa);
			
			if (Bullet.dest == true)
			{
				
					this.y = FP.camera.y + 450;
				
				
				
				Bullet.dest = false;
			}
			
			//DEFINE KONTROL
			Input.define("ATAS", Key.W, Key.UP);
			Input.define("BAWAH", Key.S, Key.DOWN);
			Input.define("KANAN", Key.D, Key.RIGHT);
			Input.define("KIRI", Key.A, Key.LEFT);
			
			
			//pergerakan pesawat
			if (Input.check("ATAS"))
			{
				y -= speed * FP.elapsed;
			}
			
			//cek bound bawah
			if (y < FP.camera.y + 460)
			{
				if (Input.check("BAWAH"))
				{
					y += speed * FP.elapsed;
				}
			}
			
			
			if (Input.check("KIRI"))
			{
				x -= speed * FP.elapsed;
			}
			
			else if (Input.check("KANAN"))
			{
				x += speed * FP.elapsed;
			}
			
			//BOUNDS
			if (x > FP.camera.x + 400)
			{
				x = 400;
			}
			else if (x < 12)
			{
				x = 12;
			}
			
			if (y < FP.camera.y)
			{
				y = FP.camera.y;
			}
			
			
			//#################GANTI TEMBAKAN JADI TEMBAKAN BIASA
			if (Input.check(Key.Z))
			{
				timeToDeltaShot += FP.elapsed;
				if (timeToDeltaShot > deltaShot)
				{
					shoot();
					timeToDeltaShot -= deltaShot;
				}
			}
			//SHOCKWAVE
			/*
			var sho:ShockWave = new ShockWave(this.x, this.y);
			if (Input.check(Key.X))
			{
				
				world.add(sho);
			}
			*/
			
			//#################TANPA DI ARAH
			//mouse click untuk tembakan
			/*
			 if (Input.check(Key.SHIFT))
			{
				shoot();
				
				timeToDeltaShot += FP.elapsed;
				if (timeToDeltaShot > deltaShot)
				{
				//shoot(Input.mouseX, Input.mouseY);
				shoot();
				timeToDeltaShot -= deltaShot;
				}
				
			}*/
			/*
			if (img.alpha < 100)
			{
				alp + (1 * FP.elapsed);
				isColliadble = true;
			}
			*/
			
		}
		
		
		
		private function shoot():void
		{
			playerSfx.play(0.5);
			
			var peluru3:Bullet = new Bullet(AssetsList.PELURUh, x, y - 15, this.x, -65000, 490);
			
			//peluru3.attackPower = power;
			
			if (world != null)
			{
				
				this.world.add(peluru3);
			}
		}
		
		
		
		
		
		
	}

}