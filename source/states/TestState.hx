package states;

import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.tiled.TiledLayer;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledTileLayer;
//import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import inputhelper.InputHelper;

/**
 * ...
 * @author Dave
 */
class TestState extends FlxState
{

	var s:FlxSprite;
	
	var text:FlxText;
	
	var m:FlxTilemap;
	
	var tm:TiledMap;
	
	//Player variables
	var gravity:Float = 1000; 
	var speed:Float = 160;
	var maxFall:Float = 300;
	var drag:Float = 1000;
	var jumpTime:Float = .2;
	var currJumpTime:Float = 0;
	//var jumpstrength:Float = 300;
	
	override public function create():Void 
	{
		super.create();
		H.initPackedTexture();
		try{
		FlxG.log.add('Does the packed texture exist? ' + H.textureAtlas.toString());
		FlxG.log.add('These are all the indexes that start with icons_bolt: ' + H.getIndexesByPrefix(H.textureAtlas, 'icons_bolt' ));
		} catch (err:Dynamic)
		{
			FlxG.log.add('No, it does not exist.');
		}
		s = new FlxSprite();
		
		var t = new FlxSprite(100, 250);
		t.frames = H.textureAtlas;
		t.animation.add('fire', H.getIndexesByPrefix(H.textureAtlas, 'icons_bolt'), 12);
		t.animation.play('fire');
		
		//s.makeGraphic(30, 30, FlxColor.RED);
		s.loadGraphic('assets/images/caveman.png', true, 32, 32);
		s.animation.add('stand', [0]);
		s.animation.add('run', [1,2,3,4,5,6,7,8], 12);
		s.animation.add('jump', [9]);
		s.animation.add('fall', [10]);
		s.animation.play('stand');
		
		text = new FlxText(100, 100, 0, "Test");
		s.setPosition(64,250);
		
		//Load the tiled map
		tm = new TiledMap('assets/data/TestMap.tmx');
		var tl:TiledTileLayer = cast tm.getLayer('collision');
		
		m = new FlxTilemap();
		try{
		m.loadMapFromArray(tl.tileArray, tm.width, tm.height, 'assets/data/32blocks.png');
		} catch (err:Dynamic)
		{
			FlxG.log.add(err);
		}
		add(m);
		
		//Bind the camera
		//FlxG.worldBounds.set();
		FlxG.camera.follow(s, FlxCameraFollowStyle.PLATFORMER);
		FlxG.camera.setScrollBoundsRect(0, 0, tm.fullWidth, tm.fullHeight, true);
		
		add(s);
		add(text);
		add(t);
		
		s.acceleration.y = gravity;
		s.maxVelocity.set(0, maxFall);
		s.drag.set(drag, 0);
	}
	
	override public function update(elapsed:Float):Void 
	{
		
		InputHelper.update();
		//Reset if we are touching the ground.
		if (s.isTouching(FlxObject.FLOOR))
		currJumpTime = 0;
		else {
			if (!InputHelper.UP)
				currJumpTime = jumpTime;
			else
				currJumpTime += elapsed;
		}
		if (InputHelper.LEFT){
			s.velocity.x = -speed;
			s.flipX = false;
		}
		if (InputHelper.RIGHT) {
		s.velocity.x = speed;
		s.flipX = true;
		}
		if (InputHelper.UP && currJumpTime < jumpTime)
		s.velocity.y = -maxFall;
		//text.text = 'Jumping: ' + InputHelper.UP + '  Is touching ground: ' + s.isTouching(FlxObject.FLOOR);
		
		
		//Update the graphic
		if (s.velocity.y > 0) {
			s.animation.play('fall');
		} else if (s.velocity.y < 0)
			s.animation.play('jump');
		else if (s.velocity.x != 0)
		s.animation.play('run');
		else
		s.animation.play('stand');
	
		
		
		super.update(elapsed);
	
		FlxG.collide(s, m);
		
		//text.text = FlxKey.fromString("UP");
		//text.text = FlxG.keys.getIsDown().toString();
		
		
	}
	
}