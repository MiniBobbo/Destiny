package states;

import dialogwindow.DialogWindow;
import dialogwindow.DialogWindowManager;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import inputhelper.InputHelper;
import openfl.display.BlendMode;
import tmxtools.TmxTools;

/**
 * ...
 * @author Dave
 */
class EndGameState extends FlxState 
{
	var maps:TmxTools;
	
	var mg:FlxTilemap;
	var dw:DialogWindow;
	var dwm:DialogWindowManager;
	
	var player:FlxSprite;
	var hooded:FlxSprite;
	
	var torches:FlxSpriteGroup;
	
	var finished:Bool = true;
	var portraitSprite:FlxSprite;
	
	var dialog:Bool = false;
	
	var fx:FlxSprite;
	
	var fin:FlxText;
	
	var explode:FlxSound;
	var land:FlxSound;
	var flames:FlxSound;
	
	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
		super.create();
		
		torches = new FlxSpriteGroup();
		
		explode = FlxG.sound.load('assets/sounds/explode.ogg');
		land= FlxG.sound.load('assets/sounds/land.ogg');
		flames= FlxG.sound.load('assets/sounds/Flames.ogg', .5);
		
		portraitSprite = new FlxSprite();
		portraitSprite.frames = FlxAtlasFrames.fromTexturePackerJson('assets/images/portraits.png', 'assets/images/portraits.json');
		portraitSprite.animation.addByPrefix('hoodangry', 'hoodangry');
		portraitSprite.animation.addByPrefix('hoodfrown', 'hoodfrown');
		portraitSprite.animation.addByPrefix('hoodnormal', 'hoodnormal');
		portraitSprite.animation.addByPrefix('hoodsmirk', 'hoodsmirk');
		portraitSprite.animation.addByPrefix('knightmad', 'knightmad');
		portraitSprite.animation.addByPrefix('knightsad', 'knightsad');
		portraitSprite.animation.addByPrefix('knightnormal', 'knightnormal');
		portraitSprite.animation.addByPrefix('knightsurprise', 'knightsurprise');
		portraitSprite.animation.addByPrefix('knightthink', 'knightthink');
		portraitSprite.animation.play('knightmad');
		
		portraitSprite.setSize(200, 200);
		
		
		player = new FlxSprite();
		player.frames = FlxAtlasFrames.fromTexturePackerJson('assets/images/mainAtlas.png', 'assets/images/mainAtlas.json');
		player.animation.addByPrefix('breathe', 'knight_breath', 4);
		player.animation.addByPrefix('run', 'knight_run', 12);
		player.animation.play('breathe');
		player.setPosition(100, 600-20);
		
		hooded = getHoodedSprite();
		hooded.animation.play('sit');
		
		fin = new FlxText(0, FlxG.height + 100, FlxG.width, 'Fin\n\nCreated by MiniBobbo (Dave)');
		fin.setFormat(null, 60, FlxColor.WHITE, FlxTextAlign.CENTER);
		fin.scrollFactor.set();
		
		fx = new FlxSprite();
		fx.scrollFactor.set();
		fx.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		fx.alpha = .5;
		
		hooded.setPosition(1115-32,520-68);
		
		var t1 = getHoodedSprite();
		var t2 = getHoodedSprite();
		var t3 = getHoodedSprite();
		var t4 = getHoodedSprite();
		t1.animation.play('off');
		t2.animation.play('off');
		t3.animation.play('off');
		t4.animation.play('off');
		t1.setPosition(400,580);
		t2.setPosition(600,580);
		t3.setPosition(880,580-64);
		t4.setPosition(1200-60, 580 - 128);
		torches.add(t1);
		torches.add(t2);
		torches.add(t3);
		torches.add(t4);
		
		//torches.animation.play('off');
		
		
		
		dw = new DialogWindow();
		dw.changeShowHidePositions(FlxPoint.weak(0, 0), FlxPoint.weak(0, -300));
		dw.addPortrait(portraitSprite, true);
		dwm = new DialogWindowManager(dw);
		
		
		
		maps = new TmxTools('assets/data/levels/finalRoom.tmx', 'assets/data/levels/');
		add(maps.getMap('bg'));
		add(maps.getMap('mg'));
		add(torches);
		add(hooded);
		add(player);
		add(fx);
		add(dw);
		add(fin);
		//FlxG.camera.follow(hooded);
		FlxG.camera.scroll.set(400, 250);
		FlxG.watch.addMouse();
		FlxG.watch.add(this, 'dialog');
		FlxG.watch.add(this, 'stage');
		
		
	}
	
	private function getHoodedSprite():FlxSprite {
		var s = new FlxSprite();
		s.frames = FlxAtlasFrames.fromTexturePackerJson('assets/images/mainAtlas.png', 'assets/images/mainAtlas.json');
		s.animation.addByPrefix('sit', 'hooded_sit');
		s.animation.addByPrefix('lookup', 'hooded_lookup', 1, false);
		s.animation.addByPrefix('stand', 'hooded_stand', 3, false);
		s.animation.addByPrefix('float', 'hooded_float', 4);
		s.animation.addByPrefix('crouch', 'hooded_crouch', 12, false);
		s.animation.addByPrefix('idle', 'hooded_idle');
		s.animation.addByPrefix('off', 'hooded_off');
		s.animation.addByPrefix('explode', 'hooded_explode', 12, false);
		s.animation.addByPrefix('burn', 'hooded_burn', 12);
		
		return s;
	}
	
	var stage:Int = 0;
	
	override public function update(elapsed:Float):Void 
	{
		var i = InputHelper;
	
		
		super.update(elapsed);
		if (dialog) {
			i.updateKeys(elapsed);
			if (i.isButtonJustPressed('attack') || i.isButtonJustPressed('jump') || FlxG.keys.justPressed.SPACE) {
				if (dwm.finished) {
					dialog = false;
					finished = true;
					dwm.next();
				} else {
					dwm.next();
				}
				
			}
				
		}
		
		
		if (finished)
			step();
		
		
	}
	
	private function playTorches(anim:String) {
		torches.forEach(function (s:FlxSprite) { s.animation.play(anim); });
	}
	
	private function step() {
		stage++;
		finished = false;
		switch (stage) 
		{
			case 1:
				FlxG.camera.fade(FlxColor.BLACK, .5, true);
				new FlxTimer().start(1.5, timerFinish);
			case 2:
				player.animation.play('run');
				FlxTween.tween(player, {x:550}, 3);
				new FlxTimer().start(3, function(_) { player.animation.play('breathe'); finish(); });
				
			case 3:
				dialog = true;
				dwm.addDialog('Brother!  I have come to call you to account for your actions!  Behold, the Sword of Destiny, which was once stolen, has been reclaimed!', 'knightmad', true, 'Chosen One');
				dwm.addDialog('Your reign of evil is at an end!', 'knightmad', true, 'Chosen One');
					dwm.addDialog('Heh heh heh...', 'hoodsmirk', false, 'Evil one');
				dwm.next();
			case 4:
				dialog = true;
				hooded.animation.play('lookup');
				new FlxTimer().start(3, function(_) {
					dialog = true;
					dwm.addDialog('I have been expecting you Sister.  Surely you did not believe that I would be ignorant of the Prophecy?', 'hoodangry', false, 'Evil One');
					dwm.next();
				});
			case 5:
				hooded.animation.play('stand');
				new FlxTimer().start(.75, function(_) { hooded.animation.play('float'); 
					explode.play();
					FlxTween.tween(hooded, {x:830, y:400}, .75, {ease:FlxEase.quadOut});
					playTorches('explode');
					FlxG.camera.flash(FlxColor.GREEN, .1);
					fx.makeGraphic(FlxG.width, FlxG.height, FlxColor.GREEN);
					fx.alpha = .5;
					fx.blend = BlendMode.ADD;
					new FlxTimer().start(.6, function(_) { playTorches('burn'); });
					flames.play();
				
				});
				new FlxTimer().start(3, function(_) { finish(); });
			case 6:
				dialog = true;
				dwm.addDialog('Your knowledge of the Prophecy does not matter fiend!  I. . .', 'knightmad', true, 'Chosen One');
				dwm.addDialog('Wait, did you say sister?', 'knightsurprise', true, 'Chosen One');
				dwm.next();
			case 7:
				new FlxTimer().start(1.5, timerFinish);
			case 8:
				dialog = true;
				FlxG.sound.music.fadeOut(.5);
				dwm.addDialog('Uh, yeah.  My twin sister who is destined to battle me for the fate of the world.  Isn\'t that you?', 'hoodfrown', false, 'Evil One');
				dwm.addDialog('No, I\'m not a girl.', 'knightthink', true, 'Chosen One');
				
				dwm.next();
			case 9:
				new FlxTimer().start(.5, timerFinish);
			case 10:
				FlxTween.tween(hooded, {y:515}, .5, {ease:FlxEase.smoothStepIn, onComplete:function(_) {hooded.animation.play('crouch'); finish(); 
					//FlxTween.tween(fx, {alpha:0}, .5);
					fx.visible = false;
					land.play();
				}});
			case 11:
				dialog = true;
				dwm.addDialog('You know, I thought your voice sounded awfully deep.  Is your mother the Lady Gelendalyn of the Sacred Rose?', 'hoodfrown', false, 'Evil One');
				dwm.addDialog('No, I was born in New Jersey…', 'knightnormal', true, 'Chosen One');
				dwm.addDialog('. . .', 'hoodfrown', false, 'Evil One');
				dwm.addDialog('. . .', 'knightnormal', true, 'Chosen One');
				dwm.addDialog('Now that I think on it, the prophecy never stated they were twin boys, did it?  I just kind of assumed based on gender stereotypes.', 'knightthink', true, 'Chosen One');
				dwm.addDialog('Yeah, sorry to have inconvenienced you with all the monsters and traps to get here.  I appreciate all the effort you put in to trying to make this duel work.  You seem like a really decent guy.  I\'m really sorry it isn\'t working out. ', 'hoodnormal', false, 'Evil One');
				dwm.addDialog('No, it is totally my fault.  I really thought the prophecy was talking about me.', 'knightsad', true, 'Chosen One');
				
				
				dwm.addDialog('I guess I should stop going by \'The Chosen One\' now.', 'knightsad', true, 'Chosen One');
				dwm.addDialog('Probably for the best.  Hey, incidentally, where did you find the sword?  I have been looking everywhere for it.', 'hoodfrown', false, 'Evil One');
				dwm.addDialog('There is a pub called Twilight about 15 minutes from here.  The basement connects to some crypts and the sword was in there.', 'knightnormal', true, 'Formerly Chosen One');
				dwm.addDialog('The pub owner is really mean.  I had to sneak in there before dawn while the pub was still closed.', 'knightsurprise', true, 'Formerly Chosen One');
				dwm.addDialog('Huh.  I thought the "The one who descends to the line between the Twilight \'for the dawn…" line was more metaphorical.  ', 'hoodfrown', false, 'Evil One');
				dwm.addDialog('Yeah, those prophecies can be pretty confusing, right? Ha ha!', 'knightnormal', true, 'Formerly Chosen One');
				dwm.addDialog('Haha!  I\'ll say!', 'hoodnormal', false, 'Evil One');
				dwm.next();
			case 12:
				new FlxTimer().start(2, timerFinish);
			case 13: 
				dialog = true;
				dwm.addDialog('Ok, well I guess I\'ll be going now.', 'knightsad', true, 'Formerly Chosen One');
				dwm.addDialog('Ok, great.  Well thanks for stopping by.  Oh, and by the way, I would go put that sword back.  So my sister can find it and we can fight our duel to decide the fate of the world.', 'hoodnormal', false, 'Evil One');
				dwm.addDialog('That\'s a good idea.   Thanks for being so understanding about all this.  Sorry for all the minions I killed on my way in here.', 'knightnormal', true, 'Formerly Chosen One');
				dwm.addDialog('Eh, don\'t worry about it.  I sometimes kill them myself for fun.  I\'ve got plenty.', 'hoodnormal', false, 'Evil One');
				dwm.addDialog('Great.  Ok, good luck with the duel.', 'knightnormal', true, 'Jim (Formerly Chosen One)');
				dwm.addDialog('Thanks.', 'hoodnormal', false, 'Evil One');
				dwm.next();
			case 14:
				player.flipX = true;
				player.animation.play('run' );
				FlxTween.tween(player, {x: 400}, .5, {onComplete:tweenFinish});
			case 15:
				player.animation.play('breathe');
				dialog = true;
				dwm.addDialog('Hey, hold up a minute.', 'hoodnormal', false, 'Evil One');
				dwm.next();
			case 16:
				player.flipX = false;
				dialog = true;
				dwm.addDialog('Yeah?', 'knightsurprise', true, 'Jim');
				dwm.next();
			case 17:
				new FlxTimer().start(1, timerFinish);
			case 18:
				dialog = true;
				dwm.addDialog('So a couple of my evil lieutenants and I go over to Twilight in the evenings and shoot some pool.  You\'re welcome to join us if you would like.', 'hoodnormal', false, 'Evil (but decent) One');
				dwm.next();
			case 19:
				new FlxTimer().start(1, timerFinish);
			case 20:
				dialog = true;
				dwm.addDialog('Yeah, that would be cool.  See you this evening.', 'knightnormal', true, 'Jim');
				dwm.addDialog('Cool.', 'hoodnormal', false, 'Evil Friend');
				dwm.next();
			case 21:
				fx .makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
				fx.alpha = 0;
				fx.visible = true;
				FlxTween.tween(fx, {alpha:1});
				FlxTween.tween(fin, {y:FlxG.height/2 - 30}, 5);
				
				
			default:
				
				
		}
	}
	
	private function timerFinish(_) {
		finish();
	}
	
	private function tweenFinish(t:FlxTween) {
		finish();
	}
	
	private function finish() {
		finished = true;
	}
	
}