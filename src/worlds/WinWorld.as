package worlds
{
	import net.flashpunk.*;
	import worlds.*;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.Alarm;
	
	public class WinWorld extends World
	{
		protected var cl:Class;
		public function WinWorld(c:Class)
		{
			cl=c;
			super();
		}
		
		override public function begin():void
		{
			addGraphic(new Image(cl));
			addTween(new Alarm(5,toTitle),true);
			
		}
		
		override public function update():void
		{
			V.Shaker.update();
		}
	
		protected function toTitle():void
		{
			FP.world = new Title();
		}
	}
}