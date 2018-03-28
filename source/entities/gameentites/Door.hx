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
class Door extends Enemy 
{
	var openSignal:String;
	
	public function new(collisionMap:FlxTilemap, openSignal:String) 
	{
		super(collisionMap);
		frames = FlxAtlasFrames.fromTexturePackerJson('assets/images/mainAtlas.png', 'assets/images/mainAtlas.json');
		animation.addByPrefix('door', 'door_flash', 6);
		animation.play('door');
		setSize(64, 192);
		this.openSignal = openSignal;
	}
	
	override public function signal(signal:String, ?data:Dynamic) 
	{
		if (openSignal == signal) {
			FlxG.camera.shake(.02, .5);
			FlxTween.tween(this, {alpha:0}, 1, {onComplete:function(_) {kill(); }});
		}
	}
	
	override public function overlapEntity(entity:Entity, ?data:Dynamic) 
	{
		//if (Std.is(entity, Player))
			FlxG.collide(this, entity);
	}
	
}