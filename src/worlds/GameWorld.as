package worlds
{
	import bosses.*;
	
	import enemies.*;
	
	import flash.display.BitmapData;
	
	import net.flashpunk.*;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.TiledImage;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.utils.*;
	
	import players.*;
	
	import utils.WaveCounter;
	
	public class GameWorld extends World
	{
		protected var enemyTimer:Number = 0;
		protected var bd:Backdrop;
		protected var friendship:FriendshipMeter;
		protected var wave:uint = 0;
		public function GameWorld()
		{
			super();
		}
		
		override public function begin():void
		{
			// Let's make our Friendship bar!
			V.Friendship = 100;
			friendship = new FriendshipMeter();
			friendship.y = FP.screen.height/2-friendship.height/2;
			add(friendship);
			bd = new Backdrop(C.GFX_BACKGROUND,true,false);
			addGraphic(bd,100);
			V.pPlayer = Player(add(new Player()));
			V.pCloner = Cloner(add(new Cloner()));
			nextWave();
		}
		
		override public function update():void
		{
			if(Input.pressed(Key.ESCAPE))
			{
				FP.world = new Title();
			}
			enemyTimer += FP.elapsed;
			V.Shaker.update();
			if (V.ShouldSpawn && enemyTimer > C.RATE_ENEMIES)
			{
				enemyTimer -= C.RATE_ENEMIES;
				switch(wave)
				{
					case 1:
						add(new Enemy(0,0,null));
					break;
					case 2:
						add(new Kitten(0,0,null));
					break;
					case 3:
						if(FP.random > 0.5) add(new Enemy(0,0,null));
						else add(new Kitten(0,0,null));
					break;
					case 4:
						add(new Kitten(0,0,null));
						add(new Enemy(0,0,null));
					break;
					case 5:
						add(new Kitten(0,0,null));
						add(new Enemy(0,0,null));
						
					break;
					default:
					break;
				}
			}
			bd.x -= FP.elapsed * C.SPEED_SCROLL;
			//friendship.x -= FP.elapsed * 2 * C.SPEED_SCROLL;
			friendship.Scale = Math.max(0,V.Friendship / 100);
			if(V.Friendship < 0) FP.world = new WinWorld(C.GFX_LOSE);
			super.update();
		}
		
		protected function nextWave():void
		{
			wave++;
			add(new WaveCounter(wave));
			
			if(wave == 5)
			{
				add(new Boss());
			}
			else
			{
				addTween(new Alarm(50,nextWave),true);
			}
		}
	}
}