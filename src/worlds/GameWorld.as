package worlds
{
	import enemies.Enemy;
	
	import flash.display.BitmapData;
	
	import net.flashpunk.*;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	
	import players.*;
	
	public class GameWorld extends World
	{
		protected var enemies:Number = 0;
		protected var bd:Backdrop;
		protected var friendship:Image;
		public function GameWorld()
		{
			super();
		}
		
		override public function begin():void
		{
			// Let's make our Friendship bar!
			friendship = new Image(C.GFX_FRIENDSHIP);
			friendship.x = FP.screen.width/2-friendship.width/2;
			friendship.y = FP.screen.height/2-friendship.height/2;
			addGraphic(friendship);
			bd = new Backdrop(C.GFX_BACKGROUND,true,false);
			addGraphic(bd,100);
			V.pPlayer = Player(add(new Player()));
			V.pCloner = Cloner(add(new Cloner()));
		}
		
		override public function update():void
		{
			enemies += FP.elapsed;
			V.Shaker.update();
			if (enemies > C.RATE_ENEMIES)
			{
				enemies -= C.RATE_ENEMIES;
				add(new Enemy(0,0,null));
			}
			bd.x -= FP.elapsed * C.SPEED_SCROLL;
			//friendship.x -= FP.elapsed * 2 * C.SPEED_SCROLL;
			friendship.scaleY = Math.max(0,V.Friendship / 100);
			friendship.x = FP.screen.width/2-friendship.width/2;
			friendship.y = FP.screen.height/2-(friendship.height*friendship.scaleY)/2;
			super.update();
		}
	}
}