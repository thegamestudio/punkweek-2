package utils
{
	import net.flashpunk.Entity;
	import net.flashpunk.*;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Text;
	
	public class WaveCounter extends Entity
	{
		public function WaveCounter(wave:uint)
		{
			Text.size = 160;
			graphic = new Text("WAVE "+wave.toString());
			Text(graphic).centerOO();
			x = 400;
			y = 700;
		}
		
		override public function update():void
		{
			y -= FP.elapsed * 100;
			var green:uint = ((0xFF << 24) | (0x00 << 16) | (FP.rand(0xFF) << 8 ) | 0x00);
			Text(graphic).color = green;
		}
	}
}