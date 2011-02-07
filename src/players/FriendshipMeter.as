package players
{
	import net.flashpunk.*;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	
	public class FriendshipMeter extends Entity
	{
		protected var img:Vector.<Image>;
		public function FriendshipMeter()
		{
			img = new Vector.<Image>;
			for(var i:uint = 0; i < 6; i++)
			{
				img.push(new Image(C.GFX_FRIENDSHIP));
				img[i].x = 165 * i;
				img[i].centerOrigin();
			}
			this.graphic = new Graphiclist(img[0],img[2],img[4]);
			this.height = 400;
		}
		
		override public function update():void
		{
			for each(var i:Image in img)
			{
				i.x -= FP.elapsed * C.SPEED_SCROLL * 10;
				if(i.x < -165) i.x += 990;
			}
		}
		
		public function set Scale(value:Number):void
		{
			for each(var i:Image in img)
			{
				i.scaleY = value;
			}
		}
	}
}