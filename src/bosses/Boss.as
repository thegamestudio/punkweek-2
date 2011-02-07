package bosses
{
	import bullets.Fetus;
	
	import net.flashpunk.*;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Masklist;
	import net.flashpunk.masks.Pixelmask;
	
	import worlds.*;
	
	public class Boss extends Entity
	{
		protected var nMask:Pixelmask;
		protected var tMask:Pixelmask;
		protected var eMask:Pixelmask;
		protected var nHP:uint = 100;
		protected var eHP:uint = 100;
		protected var tHP:uint = 100;
		protected var nGraphic:Image;
		protected var tGraphic:Image;
		protected var eGraphic:Image;
		protected var mainGraphic:Image;
		protected var moveSpeed:Number = 50;
		protected var Ear:BossEar;
		protected var Nose:BossNose;
		protected var Tongue:BossTongue;
		protected var kill:Sfx;
		protected var falling:Boolean = false;
		public function Boss()
		{
			super(0,0,null,null);
		}
		
		override public function added():void
		{
			kill = new Sfx(C.SFX_BOSSKILL);
			x = 800;
			nMask = new Pixelmask(C.GFX_BOSSNOSE);
			tMask = new Pixelmask(C.GFX_BOSSTONGUE);
			eMask = new Pixelmask(C.GFX_BOSSEAR);
			
			nGraphic = new Image(C.GFX_BOSSNOSE);
			tGraphic = new Image(C.GFX_BOSSTONGUE);
			eGraphic = new Image(C.GFX_BOSSEAR);
			mainGraphic = new Image(C.GFX_BOSS);
			
			Ear = new BossEar(x,y,eGraphic,eMask);
			Nose = new BossNose(x,y,nGraphic,nMask);
			Tongue = new BossTongue(x,y,tGraphic,tMask);
			this.world.add(Ear);
			this.world.add(Nose);
			this.world.add(Tongue);
			graphic = mainGraphic;
			mask = new Pixelmask(C.GFX_BOSS);
			//var ml:Masklist = new Masklist(nMask,tMask,eMask);
			type = "boss";
			//mask = ml;
			trace("HERE!");
		}
		
		override public function update():void
		{
			
			
			if(Ear.world == null && Nose.world==null && Tongue.world==null)
			{
				V.ShouldSpawn = false;
				if(!falling)
				{
					falling = true;
					if(!kill.playing) V.PlaySfx(kill);
					V.Shaker.start(1,6.8);
				}
				y += FP.elapsed * 600/6.8;
				if(y > 600) FP.world = new WinWorld(C.GFX_WIN);
			}
			else
			{
				x -= FP.elapsed * moveSpeed;
				if(x < 800 - mainGraphic.width) moveSpeed = -50;
				if(x > 800 - 50) moveSpeed = 50;
			}
			Ear.x = this.x;
			Nose.x = this.x;
			Tongue.x = this.x;
			Ear.y = this.y;
			Tongue.y = this.y;
			Nose.y = this.y;
			
		}
		
		protected function updateNose():void
		{
			
		}
		
		protected function updateEar():void
		{
			
		}
		
		protected function updateTongue():void
		{
			
		}
	}
}