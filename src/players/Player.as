package players
{
	import bullets.*;
	
	import flash.geom.*;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class Player extends Entity
	{
		protected var g:Spritemap;
		protected var mMan:Pixelmask;
		protected var mDog:Pixelmask;
		protected var dogSnd:Sfx;
		public function Player()
		{
			// Woof woof!
			dogSnd = new Sfx(C.SFX_WOOF);
			
			// Set up our player Spritemap.
			g = new Spritemap(C.GFX_PLAYER,177,105);
			g.setFrame(0,0);
			graphic = g;
			
			// Set up our player Pixelmask.
			mMan = new Pixelmask(C.MSK_MAN);
			mDog = new Pixelmask(C.MSK_DOG);
			
			// Begin life as man.
			mask = mMan;
			
			type = C.TYPE_PLAYER;
			x = 400;
			y = 300;
		}
		
		override public function update():void
		{
			var mx:int = 0;
			var my:int = 0;
			if(Input.check(Key.LEFT)) mx--;
			if(Input.check(Key.RIGHT)) mx++;
			if(Input.check(Key.UP)) my--;
			if(Input.check(Key.DOWN)) my++;
			if(Input.pressed(Key.SPACE)) swapHead();
			
			x += mx * FP.elapsed * C.SPEED_PLAYER;
			y += my * FP.elapsed * C.SPEED_PLAYER;
			
			checkCollision();
			
			super.update();
		}
		
		protected function swapHead():void
		{
			if(this.mask == mMan)
			{
				// We are a man. Must transcend personal being to become own best friend. Must become dog.
				this.mask = mDog;
				g.setFrame(1,0);
				dogSnd.play(V.SfxVolume);
			}
			else
			{
				// We are dog. Must become best friend. Possibly by consuming his energies?
				this.mask = mMan;
				g.setFrame(0,0);
			}
		}
		
		protected function checkCollision():void
		{
			if(collide(C.TYPE_CLONER,x,y) != null) g.color = 0xff0000;
			else g.color = 0xffffff;
		}
		
		public function bulletHit(v:Point):void
		{
			FP.world.add(new Fetus(x + halfWidth, y + halfHeight, v));
		}
	}
}