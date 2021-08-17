package;

import openfl.Lib;
import Options;
import Controls.Control;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;

class OptionsMenu extends MusicBeatState
{
	var selector:FlxText;
	var curSelected:Int = 0;

	var options:Array<OptionCatagory> = [
		new OptionCatagory("Gameplay", [
			new DFJKOption(controls),
			new GhostTapOption("Não preciso explicar, apenas preciso perguntar: tanka um desafio?"),
			new AccuracyDOption("Muda como a precisão é calculada. (Preciso = Simples, Complexo = Milisegundos)"),
		]),
		new OptionCatagory("Aparencia", [
			new AccuracyOption("Mostra informações sobre a precisão"),
			new NPSDisplayOption("Mostra a quantidade de notas vindo por segundo"),
			new SongPositionOption("Mostra a sua posição na música (como uma barra)"),
			new DownscrollOption("Muda a direção das setas"),
			new DistractionsAndEffectsOption("Esconde as distrações do cenário durante a gameplay"),

		])#if mobileC ,

		new OptionCatagory("Mobile", [
			new CustomControls("Customize seus controles"),
		]) #end

		
	];

	private var currentDescription:String = "";
	private var grpControls:FlxTypedGroup<OptionText>;
	public static var versionShit:FlxText;

	public var currentOptions:Array<FlxText> = [];

	var targetY:Array<Float> = [];

	var currentSelectedCat:OptionCatagory;

	var menuShade:FlxSprite;

	var offsetPog:FlxText;

	override function create()
	{
		var bg:FlxSprite = new FlxSprite(-10,-10).loadGraphic(Paths.image('menu/freeplay/RedBG','clown'));
		add(bg);
		var hedge:FlxSprite = new FlxSprite(-810,-335).loadGraphic(Paths.image('menu/freeplay/hedge','clown'));
		hedge.setGraphicSize(Std.int(hedge.width * 0.65));
		add(hedge);
		var shade:FlxSprite = new FlxSprite(-205,-100).loadGraphic(Paths.image('menu/freeplay/Shadescreen','clown'));
		shade.setGraphicSize(Std.int(shade.width * 0.65));
		add(shade);
		var bars:FlxSprite = new FlxSprite(-225,-395).loadGraphic(Paths.image('menu/freeplay/theBox','clown'));
		bars.setGraphicSize(Std.int(bars.width * 0.65));
		add(bars);


		
		for (i in 0...options.length)
		{
			var option:OptionCatagory = options[i];

			var text:FlxText = new FlxText(125,(95 * i) + 100, 0, option.getName(),34);
			text.color = FlxColor.fromRGB(255,0,0);
			text.setFormat("tahoma-bold.ttf", 60, FlxColor.RED);
			add(text);
			currentOptions.push(text);

			targetY[i] = i;

			trace('option king ' );
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
		}

		currentDescription = "none";

		currentOptions[0].color = FlxColor.WHITE;

		offsetPog = new FlxText(125,600,0,"			Por the Aleks e Team Silver: ");
		offsetPog.setFormat("tahoma-bold.ttf",42,FlxColor.RED);
		add(offsetPog);

		menuShade = new FlxSprite(-1350,-1190).loadGraphic(Paths.image("menu/freeplay/Menu Shade","clown"));
		menuShade.setGraphicSize(Std.int(menuShade.width * 0.7));
		add(menuShade);

		#if mobileC
		addVirtualPad(UP_DOWN, A_B);
		#end

		super.create();
	}

	var isCat:Bool = false;
	

	function resyncVocals():Void
		{
			MusicMenu.Vocals.pause();
	
			FlxG.sound.music.play();
			MusicMenu.Vocals.time = FlxG.sound.music.time;
			MusicMenu.Vocals.play();
		}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (MusicMenu.Vocals != null)
		{
			if (MusicMenu.Vocals.playing)
			{
				if (FlxG.sound.music.time > MusicMenu.Vocals.time + 20 || FlxG.sound.music.time < MusicMenu.Vocals.time - 20)
                    resyncVocals();
			}
		}


			if (controls.BACK && !isCat)
				FlxG.switchState(new MainMenuState());
			else if (controls.BACK)
			{
				isCat = false;
				for (i in currentOptions)
					remove(i);
				currentOptions = [];
				for (i in 0...options.length)
					{
						// redo shit
						var option:OptionCatagory = options[i];
					
						var text:FlxText = new FlxText(125,(95 * i) + 100, 0, option.getName(),34);
						text.color = FlxColor.fromRGB(255,0,0);
						text.setFormat("tahoma-bold.ttf", 60, FlxColor.RED);
						add(text);
						currentOptions.push(text);
					}
				remove(menuShade);
				add(menuShade);
				curSelected = 0;
				currentOptions[curSelected].color = FlxColor.WHITE;
			}
			if (controls.UP_R)
				changeSelection(-1);
			if (controls.DOWN_R)
				changeSelection(1);
			
			if (isCat)
			{
				if (currentSelectedCat.getOptions()[curSelected].getAccept())
				{
					if (FlxG.keys.pressed.SHIFT)
						{
							if (FlxG.keys.pressed.RIGHT)
							{
								currentSelectedCat.getOptions()[curSelected].right();
								currentOptions[curSelected].text = currentSelectedCat.getOptions()[curSelected].getDisplay();
							}
							if (FlxG.keys.pressed.LEFT)
							{
								currentSelectedCat.getOptions()[curSelected].left();
								currentOptions[curSelected].text = currentSelectedCat.getOptions()[curSelected].getDisplay();
							}
						}
					else
					{
						if (FlxG.keys.justPressed.RIGHT)
						{
							currentSelectedCat.getOptions()[curSelected].right();
							currentOptions[curSelected].text = currentSelectedCat.getOptions()[curSelected].getDisplay();
						}
						if (FlxG.keys.justPressed.LEFT)
						{
							currentSelectedCat.getOptions()[curSelected].left();
							currentOptions[curSelected].text = currentSelectedCat.getOptions()[curSelected].getDisplay();
						}
					}
				}
				else
				{
					if (FlxG.keys.pressed.SHIFT)
					{
						if (FlxG.keys.pressed.RIGHT)
							FlxG.save.data.offset++;
						if (FlxG.keys.pressed.LEFT)
							FlxG.save.data.offset--;
					}
					else
					{
						if (FlxG.keys.justPressed.RIGHT)
							FlxG.save.data.offset++;
						if (FlxG.keys.justPressed.LEFT)
							FlxG.save.data.offset--;
					}
				}
			}	
			else
			{
					if (FlxG.keys.pressed.SHIFT)
					{
						if (FlxG.keys.pressed.RIGHT)
							FlxG.save.data.offset++;
						if (FlxG.keys.pressed.LEFT)
							FlxG.save.data.offset--;
					}
					else
					{
						if (FlxG.keys.justPressed.RIGHT)
							FlxG.save.data.offset++;
						if (FlxG.keys.justPressed.LEFT)
							FlxG.save.data.offset--;
					}
			}

			offsetPog.text = ".     Por the Aleks e Team Silver ";

			if (controls.RESET)
					FlxG.save.data.offset = 0;

			if (controls.ACCEPT)
			{
				FlxG.sound.play(Paths.sound("confirm",'clown'));
				if (isCat)
				{
					if (currentSelectedCat.getOptions()[curSelected].press()) {
						// select thingy and redo itself
						for (i in currentOptions)
							remove(i);
						currentOptions = [];
						for (i in 0...currentSelectedCat.getOptions().length)
							{
								// clear and redo everything else
								var option:Option = currentSelectedCat.getOptions()[i];

								trace(option.getDisplay());

								var text:FlxText = new FlxText(125,(95 * i) + 100, 0, option.getDisplay(),34);
								text.color = FlxColor.fromRGB(255,0,0);
								text.setFormat("tahoma-bold.ttf", 60, FlxColor.RED);
								add(text);
								currentOptions.push(text);
							}
							remove(menuShade);
							add(menuShade);
							trace('done');
						currentOptions[curSelected].color = FlxColor.WHITE;
					}
				}
				else
				{
					currentSelectedCat = options[curSelected];
					isCat = true;
					for (i in currentOptions)
						remove(i);
					currentOptions = [];
					for (i in 0...currentSelectedCat.getOptions().length)
						{
							// clear and redo everything else
							var option:Option = currentSelectedCat.getOptions()[i];

							trace(option.getDisplay());

							var text:FlxText = new FlxText(125,(95 * i) + 100, 0, option.getDisplay(),34);
							text.color = FlxColor.fromRGB(255,0,0);
							text.setFormat("tahoma-bold.ttf", 60, FlxColor.RED);
							add(text);
							currentOptions.push(text);
						}
						remove(menuShade);
						add(menuShade);
					curSelected = 0;
					currentOptions[curSelected].color = FlxColor.WHITE;
				}
			}
		FlxG.save.flush();
	}


	var isSettingControl:Bool = false;

	function changeSelection(change:Int = 0)
	{
		#if !switch
		// NGio.logEvent("Fresh");
		#end
		
		FlxG.sound.play(Paths.sound("Hover",'clown'));

		currentOptions[curSelected].color = FlxColor.fromRGB(255,0,0);

		curSelected += change;

		if (curSelected < 0)
			curSelected = currentOptions.length - 1;
		if (curSelected >= currentOptions.length)
			curSelected = 0;


		currentOptions[curSelected].color = FlxColor.WHITE;

		var bullShit:Int = 0;
	}
}