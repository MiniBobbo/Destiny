package entities.gameentites;

import entities.Entity;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxTween;

/**
 * ...
 * @author Dave
 */
class Crystal extends Enemy 
{
	var signalToSend:String;
	
	public function new(collisionMap:FlxTilemap, signalToSend:String) 
	{
		super(collisionMap);
		frames = FlxAtlasFrames.fromTexturePackerJson('assets/images/mainAtlas.png', 'assets/images/mainAtlas.json');
		animation.addByPrefix('flash', 'crystal_flash', 6);
		animation.play('flash');
		setSize(64, 64);
		hp = 1;
		this.signalToSend = signalToSend;
	}
	
	override public function kill():Void 
	{
		H.signalAll(signalToSend);
		FlxTween.tween(this, {alpha:0}, .5, {onComplete: function(_) {alive = false; exists = false; }});
		
	}
	
	override public function overlapEntity(entity:Entity, ?data:Dynamic) 
	{
		//H.signalAll('open');
		FlxG.collide(this, entity);
	}
}