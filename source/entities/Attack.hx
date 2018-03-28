package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

enum AttackTypes {
	SHOT;
	SLICE;
}

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
	
	private var attackVelocity:FlxPoint;
	
	public var type(default, null):AttackTypes;
	
	public var partColor:FlxColor = FlxColor.BLUE;
	
	public function new(lifespan:Float = 3 ) 
	{
		super();
		frames = FlxAtlasFrames.fromTexturePackerJson('assets/images/mainAtlas.png', 'assets/images.mainAtlas.json');
		animation.addByPrefix('swing', 'slices_none', 15, false);
		animation.addByPrefix('swingdown', 'slices_none', 15, false);
		animation.addByPrefix('none', 'slices_none', 15, false);
		animation.addByPrefix('ball', 'slices_ball', 15);
		animation.play('swing');
		setSize(64, 64);
		centerOffsets();
		centerOrigin();
		//offset.x = 60;
		//offset.y = 60;
		
		attackVelocity = new FlxPoint();
		this.lifespan = lifespan;
		
		//this.velocity.set(velocity.x, velocity.y);
	}
	
	override public function update(elapsed:Float):Void 
	{
		//trace('Velocity :' + velocity);
		if (H.paused)
		return;
		velocity.copyFrom(attackVelocity);
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
		
		//trace('Attack velocity ' + v);
		acceleration.set();
		maxVelocity.set(1000,1000);
		this.lifespan = lifespan;
		animation.play(anim, true);
		switch (anim) 
		{
			case 'ball':
				setSize(30,30);
				centerOffsets();
				centerOrigin();
				type = AttackTypes.SHOT;

			default:
				setSize(64, 64);
				centerOffsets();
				centerOrigin();
				type = AttackTypes.SLICE;
		}
		attackVelocity.set(v.x, v.y);

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
		if (type == null)
			return;
			
		if (type == AttackTypes.SHOT ) {
			kill();
			
		}
			
	}
	
	
}