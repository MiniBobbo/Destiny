package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import openfl.Lib;
import openfl.net.URLRequest;
import states.EndGameState;

/**
 * ...
 * @author Dave
 */
class ProphcyState extends FlxState 
{

	var text:FlxText;
	var textSize:Int = 24;
	
	var musicButton:FlxButton;
	
	var pressToContinue:FlxText;
	
	public function new() 
	{
		super();
	}

	override public function create():Void 
	{
		super.create();
		FlxG.camera.bgColor = FlxColor.fromRGBFloat(0,0,0);
		text = new FlxText(0, FlxG.height, FlxG.width, '', textSize);
		text.setFormat('', textSize, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		
		pressToContinue = new FlxText(0, 500, FlxG.width, 'Press Space to start.\nTo skip to the ending cutscene (to see why this is in the meta game jam) press P.\nYou should play the game though. It is short.', 16 );
		pressToContinue.color = FlxColor.YELLOW;
		pressToContinue.visible = false;
		
		musicButton = new FlxButton(750, 450, 'Public domain Music by Juhani Junkala\nClick here for\naudio portfolio.', gotoURL);
		musicButton.makeGraphic(200, 100, FlxColor.GRAY);
		musicButton.label.setFormat(null, 14, FlxColor.WHITE, FlxTextAlign.CENTER);
		add(musicButton);
		
				FlxG.sound.playMusic('assets/music/mainloop.ogg');


		add(pressToContinue);
		var s = '';
		s += 'An ancient prophecy states\n\n';
		
		s += 'The sun and the moon, forever joined, a line between them strong;\n';
		s += 'The sun shines bright, forever light, and the moon is dark and wrong.\n';
		s += 'Through all the dragons, deadly beasts, and demons reign;\n';
		s += 'Through all the darkness shines the sun, the light of evil\'s bane.\n';
		s += 'The one who descends to the line between, the twilight \'fore the dawn;\n';
		s += 'shall take the blade in the name of light, where weakness is also strong.\n';
		s += 'For the enemy of dark is light, as the enemy of flesh is steel;\n';
		s += 'For the sun shall raise its blade on high, and force the dark to kneel.\n';
		
		s += '\nScholars agre that the prophecy speaks of twins, one good and on evil, who will fight to determine the fate of the world.\n';
		
		s += '\nThe time for the prophecy to be fulfilled has arrived!  A man known only as The Evil One has attacked the world of men from the West and nobody can stop him.\n\n';
		s += 'Except for his twin brother...';
		
		text.text = s;
		
		add(text);
		
		FlxTween.tween(text, {y:0}, 10);
		new FlxTimer().start(11, function(_) {pressToContinue.visible = true; });
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.SPACE) {
			FlxG.switchState(new PlayState());
		}
		if (FlxG.keys.justPressed.P)
			FlxG.switchState(new EndGameState());
			
	}
	
	private function gotoURL() {
		openfl.Lib.getURL(new URLRequest('https://www.youtube.com/watch?v=tvY0FD_rCIo'));

	}
}