package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author Dave
 */
class Attack extends FlxSprite
{
	public var lifespan:Float;
	public var strength:Int = 1;
	
	public var particleSpread:Int = 10;
	public var particleLifespan:Float = .5;
	public var particleLifespanSpread:Float = .5;
	
	
	public var partColor:FlxColor = FlxColor.BLUE;
	
	public function new(lifespan:Float = 3 ) 
	{
		super();
		frames = FlxAtlasFrames.fromTexturePackerJson('assets/images/mainAtlas.png', 'assets/images.mainAtlas.json');
		animation.addByPrefix('swing', 'slices_swing', 15, false);
		
		this.lifespan = lifespan;
		
		//this.velocity.set(velocity.x, velocity.y);
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (H.paused)
		return;
		super.update(elapsed);
		lifespan -= elapsed;
		if (lifespan <= 0) {
			this.kill();
		}
		
	}
	
	/**
	 * Resets an attacks parameters.  This should be called every time the attack is used
	 * @param	p the point this attack should appear.
	 * @param	v Velocity that this attack should travel.
	 * @param	lifespan Lifespan of the attack.
	 * @param 	The animation that this attack should have.  Doesn't do anything right now.
	 */
	public function initAttack(v:FlxPoint, lifespan:Float, anim:String) {
		ID = FlxG.random.int();
		visible = true;
		acceleration.set();
		maxVelocity.set(1000,1000);
		velocity.set(v.x, v.y);
		this.lifespan = lifespan;
		animation.play(anim, true);
	}
	
	override public function kill():Void 
	{
		super.kill();
		//TODO:Add the particle effect for attacks here.
	}
	
	/**
	 * Called by an enttiy when hit by an attack.  Override to make the attack disappear or something.
	 * @param	e
	 */
	public function hitEntity(e:Entity) {
		
	}
	
	/**
	 * Called when an attack hits the map.  Override to do soemthing.
	 */
	public function hitMap() {
		
	}
	
	
}