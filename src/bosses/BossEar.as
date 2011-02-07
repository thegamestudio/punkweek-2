package bosses
{
	import bullets.Fetus;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.tweens.misc.Alarm;
	
	public class BossEar extends Entity
	{
		protected var hp:uint = 100;
		public function BossEar(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null)
		{
			super(x, y, graphic, mask);
		}
		
		override public function update():void
		{
			var f:Fetus = Fetus(collide(C.TYPE_FETUS,x,y))
			if(f!=null)
			{
				V.PlaySfx(V.BossHit);
				flash();
				f.destroy();
				hp--;
				if(hp == 0)
				{
					this.world.remove(this);
				}
			}
		}
		
		protected function flash():void
		{
			Image(graphic).color = 0x888888;
			addTween(new Alarm(0.2,endFlash),true);
		}
		
		protected function endFlash():void
		{
			Image(graphic).color = 0xffffff;
		}
	}
}