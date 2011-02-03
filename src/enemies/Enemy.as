package enemies
{
	import bullets.Bullet;
	import bullets.Fetus;
	
	import flash.geom.Point;
	
	import net.flashpunk.*;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.*;
	import net.flashpunk.utils.Ease;

	public class Enemy extends Entity
	{
		protected var g:Spritemap;
		protected var v:Point;
		protected var t:Number = 0;
		protected var ph:Number = 10;
		protected var amp:Number = 0;
		protected var isShoot:Boolean = false;
		protected var explosionEmitter:Emitter;
		protected var enterSnd:Sfx;
		protected var exitSnd:Sfx;
		public function Enemy(x:int, y:int, v:Point)
		{
			// Make our sound.
			enterSnd = new Sfx(C.SFX_BABYGIGGLE);
			exitSnd = new Sfx(C.SFX_BABYCRY);
			if(v==null)
			{
				x = FP.screen.width + 50;
				y = FP.rand(FP.screen.height);
				this.v = new Point(-300,0);
			}
			else
			{
				isShoot = true;
				this.v = v.clone();
				this.v.normalize(C.SPEED_ENEMY_SHOOT);
			}
			
			setHitbox(48,60,-7,-5);
			
			// Set up our emitter.
			explosionEmitter = new Emitter(C.GFX_BABY_PARTICLE);
			// Define our particles
			explosionEmitter.newType("explode",[0]);
			explosionEmitter.setAlpha("explode",1,0);
			explosionEmitter.setMotion("explode", 0, 500, 1, 360, -200, -0.5, Ease.quadOut);
			explosionEmitter.relative = false;
			
			amp = Math.random()*800 - 400;
			g = new Spritemap(C.GFX_BABY_CRY,57,70);
			g.add("cry",[0,1],4);
			g.play("cry");
			graphic = new Graphiclist(g, explosionEmitter);
			super(x, y);
		}
		
		override public function added():void
		{
			try
			{
				enterSnd.play(V.SfxVolume);
				//V.PlaySfx(V.BabyGiggle);
			}
			catch (e:Error) {}
		}
		
		override public function update():void
		{
			t += FP.elapsed;
			this.x += v.x * FP.elapsed;
			if(!isShoot) v.y = amp * Math.sin(ph * t);
			this.y += v.y * FP.elapsed;
			super.update();
			handleCollision();
			if(!collidable && explosionEmitter.particleCount == 0 && world != null)
			{
				destroy();
			}
			
		}
		
		protected function handleCollision():void
		{
			if(x < -FP.screen.width || x > 2 * FP.screen.width || y < -FP.screen.height || y > 2 * FP.screen.height)
			{
				destroy();
			}
			var b:Bullet = Bullet(collide(C.TYPE_BULLET,x,y));
			if(b != null)
			{
				FP.world.add(new Enemy(x,y,b.Velocity));
				b.destroy();
			}
			
			var f:Fetus = Fetus(collide(C.TYPE_FETUS, x, y));
			if(f!=null)
			{
				// Score increase.
				f.destroy();
				explode();
			}
		}
		
		public function explode():void
		{
			// Blow up!
			try
			{
				//V.PlaySfx(V.BabyCry);
				exitSnd.play(V.SfxVolume);
			}
			catch (e:Error) {}
			for(var i:uint = 0; i < 100; i++)
			{
				explosionEmitter.emit("explode", x + width/2, y + height/2);
			}
			
			this.collidable = false;
			g.visible = false;
		}
		
		public function destroy():void
		{
			if(this.world != null) this.world.remove(this);
		}
	}
}