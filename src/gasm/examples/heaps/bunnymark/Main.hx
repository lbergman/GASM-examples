package gasm.examples.heaps.bunnymark;
import gasm.core.components.TextModelComponent;
import gasm.extra.components.FPSDisplayComponent;
import h2d.Bitmap;
import h2d.Font;
import h2d.Sprite;
import h2d.Tile;
import hxd.inspect.Inspector;
import hxd.inspect.Panel;
import hxd.Res;
import gasm.core.Entity;
import gasm.extra.components.BounceAroundComponent;
import gasm.extra.components.FPSComponent;
import gasm.heaps.components.HeapsSpriteComponent;
import gasm.heaps.components.HeapsTextComponent;
import gasm.heaps.HeapsContext;


/**
 * ...
 * @author Leo Bergman
 */
class Main extends HeapsContext 
{
	
	public function new() 
	{
		super();
	}
	override function init() 
	{
		super.init();
		testBunnies(1000);
		var tc:HeapsTextComponent = new HeapsTextComponent(Res.fonts.ARIAL.build(25));
		var ent = new Entity()
					.add(tc).add(new TextModelComponent("0", 25, 0xFFAA00))
					.add(new FPSComponent()).add(new FPSDisplayComponent());
		tc.outline();
		
		baseEntity.addChild(ent);
	}
	
	function testBunnies(count:Int) 
	{
		var tile = hxd.Res.img.wabbit_alpha.toTile();
		tile.center();
		for (i in 0...count)
		{
			var sp = new h2d.Sprite();
			var bmp = new h2d.Bitmap(tile, sp);
			var ent = new Entity().add(new HeapsSpriteComponent(sp)).add(new BounceAroundComponent());
			baseEntity.addChild(ent);
		}
		
	}
	
	static function main() {
		hxd.Res.initEmbed();
		new Main();
	}

}
