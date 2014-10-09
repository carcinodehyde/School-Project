package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author dd.Production()
	 */
	public class Enemy extends Entity 
	{
		//STATUS
		public var health:Number;
        public var power:Number;
        public var shield:Number;
        public var speed:int = 50;
		
		private var img:Spritemap;
		private var logic:EnemyAI;
		
		public function Enemy(sprite:*, AI:EnemyAI)
		{
			img = new Spritemap(sprite, 38, 38);
			img.add("fly", [0, 1, 2], 10);
			
			img.centerOO();
			graphic = img;
			img.play("fly");
			
			img.scrollY = 1;
			
			setHitbox(20, 10, 11);
			
			type = "musuh";
			
			logic = AI;
			logic.actor = this;
		}
		
		override public function update():void
		{
			logic.update(FP.elapsed);
		}
		
	}

}