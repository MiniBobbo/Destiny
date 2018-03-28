package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Dave
 */
class Checkpoint extends FlxSprite
{

	public var name:String;
	
	/**
	 * Create a new checkpoint that can be used to save the game and 
	 * @param	refresh
	 * @param	savable
	 */
	public function new(refresh:Bool = false, savable:Bool = false) 
	{
		super();
		loadGraphic('assets/images/checkpoint.png', true, 32, 32);
		animation.add('off', [0]);
		animation.add('on', [1, 2], 12);
		animation.play('off');
		
		this.setSize(24, 30);
		this.offset.set(4, 0);
		this.updateHitbox();
		
	}
	
	
}