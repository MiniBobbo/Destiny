package entities.gameentites;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;

/**
 * ...
 * @author Dave
 */
class GenericMonster extends Enemy 
{
	

	public function new(?x:Float, ?y:Float) 
	{
		super(x, y);
		makeGraphic(100, 100, FlxColor.RED);
		health = 3;
	}
	
	override public function hurt(Damage:Float):Void 
	{
		if (FlxSpriteUtil.isFlickering)
			return;
		super.hurt(Damage);
		if (!alive)
			return;
		FlxSpriteUtil.flicker(this, H.ENEMY_FLICKER_TIME);
	}
	
	override public function kill():Void 
	{	
		FlxTween.tween(this, {alpha:0}, .5);
		alive = false;
	}
}