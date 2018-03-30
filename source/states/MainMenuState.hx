package states;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.ui.FlxButton;
import flixel.util.FlxSort;

/**
 * ...
 * @author Dave
 */
class MainMenuState extends FlxState 
{

	var fbg:FlxSprite;
	var bbg:FlxSprite;
	var hero:FlxSprite;
	var herojump:FlxSprite;
	
	var displayGroup:FlxSpriteGroup;
	
	var startButton:FlxButton;
	var endButton:FlxButton;
	
	
	public function new() 
	{
		
	}
	
	
	override public function create():Void 
	{
		super.create();
		displayGroup = new FlxSpriteGroup();
		
		bbg = new FlxSprite(0,0,'assets/image/titlebg.png');
		fbg = new FlxSprite(0,0,'assets/image/titlefg.png');
		hero = new FlxSprite(0,0,'assets/images/herostand.png');
		herojump = new FlxSprite(0,0,'assets/images/heroleap.png');
		
		bbg.ID = 10;
		fbg.ID = 1;
		
		
	}
}