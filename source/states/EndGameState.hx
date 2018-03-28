package states;

import dialogwindow.DialogWindow;
import dialogwindow.DialogWindowManager;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
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
	
	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
		super.create();
		
		torches = new FlxSpriteGroup();
		
		
		
		portraitSprite = new FlxSprite();
		portraitSprite.frames = FlxAtlasFrames.fromTexturePackerJson('assets/images/portraits.png', 'assets/images/portraits.json');
		
		player = new FlxSprite();
		player.frames = FlxAtlasFrames.fromTexturePackerJson('assets/images/mainAtlas.png', 'assets/images/mainAtlas.json');
		player.animation.addByPrefix('breathe', 'knight_breath', 4);
		player.animation.addByPrefix('run', 'knight_run', 12);
		player.animation.play('breathe');
		player.setPosition(100, 600-20);
		
		hooded = getHoodedSprite();
		hooded.animation.play('sit');
		
		fin = new FlxText(0, FlxG.height + 100, FlxG.width, 'Fin');
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
		dw.changeShowHidePositions(FlxPoint.weak(0,0), FlxPoint.weak(0,-300));
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
			if (i.isButtonJustPressed('attack') || i.isButtonJustPressed('jump')) {
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
				dwm.addDialog('Brother!  I have come to call you to account for your actions!  Behold, the Sword of Destiny, which was once stolen, has been reclaimed!');
				dwm.addDialog('Your reign of evil is at an end!');
				dwm.next();
			case 4:
				dialog = true;
				hooded.animation.play('lookup');
				new FlxTimer().start(3, function(_) {
					dialog = true;
					dwm.addDialog('Heh heh heh...');
					dwm.addDialog('I have been expecting you Sister.  Surely you did not believe that I would be ignorant of the Prophecy?');
					dwm.next();
				});
			case 5:
				hooded.animation.play('stand');
				new FlxTimer().start(.75, function(_) { hooded.animation.play('float'); 
					FlxTween.tween(hooded, {x:830, y:400}, .75, {ease:FlxEase.quadOut});
					playTorches('explode');
					FlxG.camera.flash(FlxColor.GREEN, .1);
					fx.makeGraphic(FlxG.width, FlxG.height, FlxColor.GREEN);
					fx.alpha = .5;
					fx.blend = BlendMode.ADD;
					new FlxTimer().start(.6, function(_) { playTorches('burn'); });
				
				});
				new FlxTimer().start(3, function(_) { finish(); });
			case 6:
				dialog = true;
				dwm.addDialog('Your knowledge of the Prophecy does not matter fiend!  I…');
				dwm.addDialog('Wait, did you say sister?');
				dwm.next();
			case 7:
				new FlxTimer().start(1.5, timerFinish);
			case 8:
				dialog = true;
				dwm.addDialog('Uh, yeah.  My twin sister who is destined to battle me for the fate of the world.  Isn\'t that you?');
				dwm.addDialog('No, I\'m not a girl.');
				
				dwm.next();
			case 9:
				new FlxTimer().start(.5, timerFinish);
			case 10:
				FlxTween.tween(hooded, {y:515}, .5, {ease:FlxEase.smoothStepIn, onComplete:function(_) {hooded.animation.play('crouch'); finish(); 
					FlxTween.tween(fx, {alpha:0}, .5);
				}});
			case 11:
				dialog = true;
				dwm.addDialog('You know, I thought your voice sounded awfully deep.  Is your mother the Lady Gelendalyn of the Sacred Rose?');
				dwm.addDialog('No, I was born in New Jersey…');
				dwm.addDialog('…');
				dwm.addDialog('Now that I think on it, the prophecy never stated they were twin boys, did it?  I just kind of assumed based on gender stereotypes.');
				dwm.addDialog('Yeah, sorry to have inconvenienced you with all the monsters and traps to get here.  I appreciate all the effort you put in to trying to make this duel work.  You seem like a really decent guy.  I\'m really sorry it isn\'t working out. ');
				dwm.addDialog('No, it is totally my fault.  I really thought the prophecy was talking about me.');
				
				
				dwm.addDialog('I guess I should stop going by \'The Chosen One\' now.');
				dwm.addDialog('Probably for the best.  Hey, incidentally, where did you find the sword?  I have been looking everywhere for it.');
				dwm.addDialog('There is a pub called Twilight about 15 minutes from here.  The basement connects to some crypts and the sword was in there.');
				dwm.addDialog('The pub owner is really mean.  I had to sneak in there before dawn while the pub was still closed.');
				dwm.addDialog('Huh.  I thought the "The one who descends to the line between the Twilight \'for the dawn…" line was more metaphorical.  ');
				dwm.addDialog('Yeah, those prophecies can be pretty confusing, right? Ha ha!');
				dwm.addDialog('Haha!  I\'ll say!');
				dwm.next();
			case 12:
				new FlxTimer().start(2, timerFinish);
			case 13: 
				dialog = true;
				dwm.addDialog('Ok, well I guess I\'ll be going now.');
				dwm.addDialog('Ok, great.  Well thanks for stopping by.  Oh, and by the way, I would go put that sword back.  So my sister can find it and we can fight our duel to decide the fate of the world.');
				dwm.addDialog('That\'s a good idea.   Thanks for being so understanding about all this.  Sorry for all the minions I killed on my way in here.');
				dwm.addDialog('Eh, don\'t worry about it.  I sometimes kill them myself for fun.  I\'ve got plenty.');
				dwm.addDialog('Great.  Ok, good luck with the duel.');
				dwm.addDialog('Thanks.');
				dwm.next();
			case 14:
				player.flipX = true;
				player.animation.play('run' );
				FlxTween.tween(player, {x: 400}, .5, {onComplete:tweenFinish});
			case 15:
				player.animation.play('breathe');
				dialog = true;
				dwm.addDialog('Hey, hold up a minute.');
				dwm.next();
			case 16:
				player.flipX = false;
				dialog = true;
				dwm.addDialog('Yeah?');
				dwm.next();
			case 17:
				new FlxTimer().start(1, timerFinish);
			case 18:
				dialog = true;
				dwm.addDialog('So a couple of my evil lieutenants and I go over to Twilight in the evenings and shoot some pool.  You\'re welcome to join us if you would like.');
				dwm.next();
			case 19:
				new FlxTimer().start(1, timerFinish);
			case 20:
				dialog = true;
				dwm.addDialog('Yeah, that would be cool.  See you this evening.');
				dwm.addDialog('Cool.');
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