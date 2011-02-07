package enemies
{
	import flash.geom.Point;
	
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.*;
	
	public class Kitten extends Enemy
	{
		public function Kitten(x:int, y:int, v:Point)
		{
			super(x, y, v);
			this.g = new Spritemap(C.GFX_KITTEN, 131,70);
			this.g.add("n",[0]);
			this.g.play("n");
			this.setHitbox(100,60,20,5);
			this.hp = 2;
			graphic = new Graphiclist(g, explosionEmitter);
			trace("kitten");
			this.enterSnd = new Sfx(C.SFX_CATENTER);
			this.exitSnd = new Sfx(C.SFX_CATEXIT);
			this.v = new Point(-400,0);
			this.amp = 0;
		}
	}
}