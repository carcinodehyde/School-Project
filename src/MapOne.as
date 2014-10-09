package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class MapOne extends World 
	{
		//instantiasi HERO
		private var airship:Character = new Character(AssetsList.AIRSHIP);
		
		
		//INSTANTIASI MAP
		private var tile:Tiles = new Tiles(AssetsList.TILEMAP1);
		private var headup:headUp = new headUp(AssetsList.hud);
		
		//CAMERA
		private var runOnce:Boolean = false;
		private var cameraSpeed:int = 60;
		
		private var grap:Backdrop = new Backdrop(AssetsList.back, true, true);
		private var nextSpawn:Number = 6;
		private var nextSpawn2:Number = 20;
		private var nextSpawn3:Number = 30;
		
		private var swc1:Boolean = false;
		private var swc2:Boolean = false;
		
		
		private var sfx:Sfx = new Sfx(AssetsList.end);
		
		//marker
		private var marker:Entity = new Entity;
		private var once:int = 1;
		
		public function MapOne() 
		{
			sfx.loop(0.7);
			//########AKTOR############
			//HERO
			airship.x = 300;
			airship.y = 400; //400
			
			//STATUS AWAL
			airship.power = 100;
			airship.shield = 50;
			Character.health = 500;
			
			
			
			add(airship);
			
			//HUD
			headup.x = 0;
			headup.y = 0;
			
			//############TILE
			/*
			tile.img.setRect(0, 10, 20, 45, 0);
			tile.img.setRect(5, 2, 4, 3, 3);
			tile.img.setRect(3, 5, 5, 4, 10);
			tile.img.setRect(4, 6, 3, 2, 2);
			tile.img.setRect(13, 5, 6, 7, 5);
			
			tile.img.setRect(15, 16, 4, 7, 3);
			tile.img.setRect(0, 16, 7, 9, 5);
			tile.img.setRect(15, 20, 3, 8, 2);
			tile.img.setRect(3, 20, 10, 7, 1);
			tile.img.setRect(8, 25, 9, 8, 2);
			tile.img.setRect(11, 32, 7, 6, 4);
			tile.img.setRect(2, 30, 8, 10, 3);
			tile.img.setRect(7, 40, 11, 1, 3);
			tile.img.setRect(4, 41, 12, 1, 3);
			tile.img.setRect(8, 42, 9, 1, 4);
			tile.img.setRect(9, 43, 11, 1, 4);
			tile.img.setRect(0, 44, 19, 1, 4);
			tile.layer = 12;
			
			tile.img.scrollX = 0.5;
			tile.img.scrollY = 0.5;
			add(tile);
			*/
			
			
			
			grap.scrollX = 0.5;
			grap.scrollY = 1;
			var gr:Entity = new Entity;
			gr.graphic = grap;
			gr.layer = 100;
			add(gr);
			
			//marker
			marker.x = 450;
			
			
		}
		
		override public function update():void
		{
			super.update();
			
			add(headup);
			
			//marker
			marker.y = FP.camera.y + 470;
			add(marker);
			
			//gameover
			if (Character.sisaNyawa == 1)
			{
				FP.world = new GameOver;
				sfx.stop();
			}
			
			camera.y -= cameraSpeed * FP.elapsed;
			airship.y -= cameraSpeed * FP.elapsed;
			
			nextSpawn -= FP.elapsed;
			nextSpawn2 -= FP.elapsed;
			nextSpawn3 -= FP.elapsed;
			
			//SPAWN ENEMY
			/*
			trace("marker " + marker.y);
			
			if (marker.y < 220 && marker.y > 180)
			{
				if (once == 1)
				{
					//BASIC AI 1
					for (var i:int = 0; i < 395; i += 90)
					{
					var AI1:BasicAI = new BasicAI(airship);
					var enemy:Enemy = new Enemy(AssetsList.ENEMY1, AI1);
					
					
					enemy.x = i + 15;
					enemy.y = (FP.camera.y + FP.height - 480) - i;
					
					
					
					add(enemy);
					}
				}
				
				once = 0;
			}
			
			*/
			
			
				if (nextSpawn <= 0)
				{
					nextSpawn = 6;
					
					
					//BASIC AI 1
					for (var i:int = 0; i < 395; i += 90)
					{
					var AI1:BasicAI = new BasicAI(airship);
					var enemy:Enemy = new Enemy(AssetsList.ENEMY1, AI1);
					
					
					enemy.x = i + 15;
					enemy.y = (FP.camera.y + FP.height - 480) - i;
					
					
					
					
					add(enemy);
					
					}
					
					
				}
				
			
			/*
			if (nextSpawn2 <= 0)
			{
				nextSpawn2 = 20;
				
				//AI 3
				var AI3:Bullet2AI = new Bullet2AI();
				var enemy3:Enemy = new Enemy(AssetsList.ENEMY1, AI3);
				
				enemy3.x = FP.halfWidth - 100;
				enemy3.y = FP.camera.y + FP.height - 480;
				add(enemy3);
				add(enemy3);
				
				
			}
			*/
			if (nextSpawn3 <= 0)
			{
				
				//for (var j:int = 0; j < 280; j += 90)
				//{
				//AI 2
				var AI2:Bullet1AI = new Bullet1AI();
				var enemy2:Enemy = new Enemy(AssetsList.ENEMY1, AI2);
				
				//enemy2.x = j + 20;
				enemy2.x = 195;
				enemy2.y = FP.camera.y + 30;
				add(enemy2);
				
				//}
				swc1 = true;
				nextSpawn3 = 30;
				
			}
			
			
			
			/*
			else if (Input.check(Key.K))
			{
				FP.camera.y += 10;
			}
			if (Input.check(Key.J))
			{
				FP.camera.x -= 10;
			}
			else if (Input.check(Key.L))
			{
				FP.camera.x += 10;
			}
			*/
		}
		
	}

}
