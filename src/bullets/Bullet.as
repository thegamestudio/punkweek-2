package bullets
{
	import flash.geom.Point;
	
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;
	
	public class Bullet extends Entity
	{
		protected var g:Image;
		protected var v:Point;
		protected var a:Point;
		public function Bullet(x:Number, y:Number, v:Point)
		{
			super(x-16, y-16);
			g = new Image(C.GFX_BULLET);
			graphic = g;
			g.centerOO();
			setHitbox(32,32,16,16);
			this.v = v.clone();
			a = new Point();
			
			type = C.TYPE_BULLET;
			
			
		}
		
		override public function update():void
		{
			g.angle += 360 * FP.elapsed;
			
			a.x = V.pPlayer.x + 82 - x;
			a.y = V.pPlayer.y + 52 - y;
			
			v.x += C.ACC_BULLET * a.x * FP.elapsed;
			v.y += C.ACC_BULLET * a.y * FP.elapsed;
			
			v.x = FP.clamp(v.x,-C.SPEED_BULLET,C.SPEED_BULLET);
			v.y = FP.clamp(v.y,-C.SPEED_BULLET,C.SPEED_BULLET);
			
			x += v.x * FP.elapsed;
			y += v.y * FP.elapsed;
			
			if(x < -FP.screen.width || x > 2 * FP.screen.width || y < -FP.screen.height || y > 2 * FP.screen.height)
			{
				destroy();
			}
			
			if(this.collideWith(V.pPlayer,x,y)!=null)
			{
				V.pPlayer.bulletHit(v);
				destroy();
			}
			
			super.update();
		}
		
		public function destroy():void
		{
			if(this.world != null) FP.world.remove(this);
		}
		
		public function get Velocity():Point
		{
			return v;
		}
	}
}