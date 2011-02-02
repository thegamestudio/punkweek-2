package bullets
{
	import flash.geom.Point;
	
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;
	
	public class Bullet extends Entity
	{
		protected var g:Image;
		protected var v:Point;
		public function Bullet(x:Number, y:Number, v:Point)
		{
			g = new Image(C.GFX_BULLET);
			graphic = g;
			g.centerOrigin();
			setHitbox(32,32);
			this.v = v.clone();
			super(x-16, y-16);
		}
		
		override public function update():void
		{
			g.angle += 360 * FP.elapsed;
			x += v.x * FP.elapsed;
			y += v.y * FP.elapsed;
		}
	}
}