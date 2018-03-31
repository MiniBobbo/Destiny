package entities.gameentites;

import entities.Entity;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.system.FlxSound;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxTween;

/**
 * ...
 * @author Dave
 */
class Door extends Enemy 
{
	var openSignal:String;
	
	var open:FlxSound;
	
	public function new(collisionMap:FlxTilemap, openSignal:String) 
	{
		super(collisionMap);
		frames = FlxAtlasFrames.fromTexturePackerJson('assets/images/mainAtlas.png', 'assets/images/mainAtlas.json');
		animation.addByPrefix('door', 'door_flash', 6);
		animation.play('door');
		setSize(64, 192);
		this.openSignal = openSignal;
		open = FlxG.sound.load('assets/sounds/open.wav');
	}
	
	override public function signal(signal:String, ?data:Dynamic) 
	{
		if (openSignal == signal) {
			FlxG.camera.shake(.02, .5);
			//open.play();
			FlxTween.tween(this, {alpha:0}, 1, {onComplete:function(_) {kill(); }});
		}
	}
	
	override public function overlapEntity(entity:Entity, ?data:Dynamic) 
	{
		//if (Std.is(entity, Player))
			FlxG.collide(this, entity);
	}
	
}