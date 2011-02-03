package players
{
	import bullets.Bullet;
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Cloner extends Entity
	{
		protected var g:Image;
		protected var m:Pixelmask;
		protected var fireRate:Number;
		public function Cloner()
		{
			fireRate = 0;
			x = 20;
			y = 300;
			g = new Image(C.GFX_CLONER);
			graphic = g;
			
			m = new Pixelmask(C.GFX_CLONER);
			mask = m;
			
			type = C.TYPE_CLONER;
		}
		
		override public function update():void
		{
			var mx:int = 0;
			var my:int = 0;
			if(Input.check(Key.A)) mx--;
			if(Input.check(Key.D)) mx++;
			if(Input.check(Key.W)) my--;
			if(Input.check(Key.S)) my++;
			
			x += mx * FP.elapsed * C.SPEED_CLONER;
			y += my * FP.elapsed * C.SPEED_CLONER;
			
			fireBullets();
			
			checkCollision();
			
			super.update();
		}
		
		protected function fireBullets():void
		{
			fireRate += FP.elapsed;
			if(fireRate >= C.RATE_SHOOT)
			{
				fireRate -= C.RATE_SHOOT;
				var v:Point = new Point();
				v.x = -this.x + V.pPlayer.x + V.pPlayer.halfWidth;
				v.y = -this.y + V.pPlayer.y + V.pPlayer.halfHeight;
				v.normalize(C.SPEED_BULLET);
				FP.world.add(new Bullet(x+halfWidth, y+halfHeight,v));
			}
		}
		
		protected function checkCollision():void
		{
			//if(collide(C.TYPE_PLAYER,x,y) != null) g.color = 0xff0000;
			//else g.color = 0xffffff;
		}
	}
}