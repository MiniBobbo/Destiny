package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

/**
 * ...
 * @author Dave
 */
class ProphcyState extends FlxState 
{

	var text:FlxText;
	var textSize:Int = 24;
	
	public function new() 
	{
		super();
	}

	override public function create():Void 
	{
		super.create();
		FlxG.camera.bgColor = FlxColor.fromRGBFloat(0,.4,.4);
		text = new FlxText(0, FlxG.height, FlxG.width, '', textSize);
		text.setFormat('', textSize, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		
		var s = '';
		s += 'Twins born from the same womb at twighlight,\n\n';
		s += 'One born in the light and the other the dark.\n\n';
		s += 'The dark one will twist and corrupt the world\n\n';
		s += 'Until the light one rises,\n\n';
		s += 'Into the depth of Twilight the light one journeys\n\n';
		s += 'Retrieving the sword that was stolen and bound\n\n';
		s += 'The two shall battle\n\n';
		s += 'Light against dark\n\n';
		s += 'Sibling against sibling\n\n';
		s += 'With the fate of the world hanging in balance.\n\n';
		
		text.text = s;
		
		add(text);
		
		FlxTween.tween(text, {y:0}, 10);
	}
}