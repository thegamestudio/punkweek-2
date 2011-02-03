package worlds
{
	import enemies.Enemy;
	
	import net.flashpunk.*;
	import net.flashpunk.graphics.Backdrop;
	
	import players.*;
	
	public class GameWorld extends World
	{
		protected var enemies:Number = 0;
		protected var bd:Backdrop;
		public function GameWorld()
		{
			super();
		}
		
		override public function begin():void
		{
			bd = new Backdrop(C.GFX_BACKGROUND,true,false);
			addGraphic(bd,100);
			V.pPlayer = Player(add(new Player()));
			V.pCloner = Cloner(add(new Cloner()));
		}
		
		override public function update():void
		{
			enemies += FP.elapsed;
			if (enemies > C.RATE_ENEMIES)
			{
				enemies -= C.RATE_ENEMIES;
				add(new Enemy(0,0,null));
			}
			bd.x -= FP.elapsed * C.SPEED_SCROLL;
			super.update();
		}
	}
}