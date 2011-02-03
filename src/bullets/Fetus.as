package bullets
{
	import flash.geom.Point;
	
	import net.flashpunk.*;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	
	public class Fetus extends Entity
	{
		protected var g:Image;
		protected var v:Point;
		public function Fetus(x:Number, y:Number, v:Point)
		{
			super(x, y);
			g = new Image(C.GFX_CLONE);
			g.centerOO();
			graphic = g;
			setHitbox(32,32,16,16);
			this.v = v.clone();
			this.v.normalize(1);
			this.type = C.TYPE_FETUS;
		}
		
		override public function update():void
		{
			x += v.x * C.SPEED_FETUS * FP.elapsed;
			y += v.y * C.SPEED_FETUS * FP.elapsed;
			g.angle += 180 * FP.elapsed;
			
			if(x < -16 || x > FP.screen.width + 16 || y < -16 || y > FP.screen.height + 16)
			{
				destroy();
			}
			
			super.update();
		}
		
		
		
		public function destroy():void
		{
			if(this.world != null) FP.world.remove(this);
		}
	}
}