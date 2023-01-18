package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.FlxG;
import flixel.math.FlxRandom;
import flxanimate.motion.AdjustColor;

class PlayState extends FlxState
{
	var adjust = new AdjustColor();

	override public function create()
	{
		adjust.brightness = FlxG.random.int(0, 255);
		adjust.contrast = FlxG.random.int(0, 255);
		adjust.saturation = FlxG.random.int(0, 255);
		adjust.hue = FlxG.random.int(0, 255);

		var background = FlxGridOverlay.create(10, 10);
		add(background);
		var bf = new FlxSprite(AssetPaths.bf__png);
		bf.screenCenter();
		bf.antialiasing = true;
		var shader = new AdjustShader();
		shader.matrix = adjust.calculateFinalFlatArray();
		bf.shader = shader.shader;
		add(bf);
		var filteredbf = new FlxSprite(bf.x + bf.width, bf.y, AssetPaths.filtered_bf__png);
		filteredbf.antialiasing = true;
		add(filteredbf);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
