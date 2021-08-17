package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		switch(char)
		{
			case 'trickyMask' | 'tricky':
				loadGraphic(Paths.image('IconGridTricky','clown'), true, 150, 150);

				antialiasing = false;
				animation.add('tricky', [2, 3], 0, false, isPlayer);
				animation.add('trickyMask', [0, 1], 0, false, isPlayer);
			case 'trickyH':
				loadGraphic(Paths.image('hellclwn/hellclownIcon','clown'), true, 150, 150);
				animation.add('trickyH', [0, 1], 0, false, isPlayer);
				y -= 25;
			case 'exTricky':
				loadGraphic(Paths.image('fourth/exTrickyIcons','clown'), true, 150, 150);
				animation.add('exTricky', [0, 1], 0, false, isPlayer);
			default:
				loadGraphic(Paths.image('iconGrid'), true, 150, 150);

				antialiasing = false;
				animation.add('bf', [0, 1], 0, false, isPlayer);
		}
		animation.play(char);
		antialiasing = false;
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
