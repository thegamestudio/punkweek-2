package worlds
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import worlds.*;
	
	public class Title extends World
	{
		public function Title()
		{
			super();
		}
		
		override public function begin():void
			
		{
			addGraphic(new Image(C.GFX_TITLE));
			V.PlaySfx(new Sfx(C.SFX_TITLE));
		}
		
		override public function update():void
			
		{
			V.Shaker.update();
			if(Input.pressed(Key.I))
			{
				addGraphic(new Image(C.GFX_INSTRUCTIONS));
			}
			
			if(Input.pressed(Key.SPACE))
			{
				FP.world = new GameWorld();
			}
			
			if(Input.pressed(Key.ESCAPE))
			{
				FP.world = new Title();
			}
		}
	}
}