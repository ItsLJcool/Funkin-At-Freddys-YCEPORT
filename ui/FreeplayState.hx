// a
import flixel.tweens.misc.ColorTween;
import CoolUtil;

var bg:FlxSprite;
var grid1:FlxBackdrop;
var grid2:FlxBackdrop;
var songImage:FlxSprite;
var daNewScore:FlxText;
var difficultyText:FlxText;

function createPost() {
	bg = new FlxSprite().makeGraphic(FlxG.width * 3, FlxG.height * 3, 0xFF000000);
	bg.antialiasing = EngineSettings.globalAntialiasing;
	bg.screenCenter();
	add(bg);

	grid1 = new FlxBackdrop(Paths.image('fpstuff/gridsquarelol'), 5, 5, true, true);
	grid1.antialiasing = EngineSettings.globalAntialiasing;
	add(grid1);

	grid2 = new FlxBackdrop(Paths.image('fpstuff/gridsquarelmao'), 3, 3, true, true);
	grid2.antialiasing = EngineSettings.globalAntialiasing;
	add(grid2);

	grid1.color = _songs[curSelected].color;
	grid2.color = _songs[curSelected].color;

	songImage = new FlxSprite();
	songImage.frames = Paths.getSparrowAtlas('fpstuff/freeplay');

	var animList = [
		["new", "new", 2],
		['locked', "lock", 12],
		["celebrate", "celebrate", 12],
		["follow-me", "follow-me", 12],
		["midnight", "midnight", 12],
		["you-can't", "you-can't", 12],
		["salvage", "salvage", 12],
		["nightmare", "nightmare", 12],
		["umbra", "umbra", 12],
		["just-a-theory", "just-a-theory", 12],
		["fourth-wall", "fourth-wall", 12],
		["fazbars", "fazbars", 12],
		["consequences", "new", 12],
		["fourth-crocs", "fourth-crocs", 12]
	];

	for (anim in animList)
		songImage.animation.addByPrefix(anim[0], anim[1], anim[2]);

	songImage.animation.play("celebrate");
	songImage.screenCenter();
	add(songImage);

	// var arrowleft:FlxSprite = new FlxSprite(songImage.x - 200, -100).loadGraphic(Paths.image('fpstuff/selectArrow'));
	var arrowleft:FlxSprite = new FlxSprite(0, songImage.y - 505).loadGraphic(Paths.image('fpstuff/selectArrow'));
	arrowleft.angle = 90;
	arrowleft.antialiasing = EngineSettings.globalAntialiasing;
	arrowleft.flipX = true;
	arrowleft.setGraphicSize(Std.int(arrowleft.width * 0.4));
	arrowleft.screenCenter(FlxAxes.X);
	add(arrowleft);

	var arrowRight:FlxSprite = new FlxSprite(0, songImage.y + 90).loadGraphic(Paths.image('fpstuff/selectArrow'));
	arrowRight.angle = 90;
	arrowRight.antialiasing = EngineSettings.globalAntialiasing;
	arrowRight.setGraphicSize(Std.int(arrowRight.width * 0.4));
	arrowRight.screenCenter(FlxAxes.X);
	add(arrowRight);

	updateSongImage();

	daNewScore = new FlxText(FlxG.width * 0.7, songImage.x, 0, "", 32);
	daNewScore.setFormat(Paths.font("vcr.ttf"), 32, 0xFFFFFF, "RIGHT");
	daNewScore.antialiasing = EngineSettings.antialiasing;
	daNewScore.y -= 200;
	add(daNewScore);

	difficultyText = new FlxText(FlxG.width * 0.7, songImage.x, 0, "", 32);
	difficultyText.setFormat(Paths.font("vcr.ttf"), 32, 0xFFFFFF, "RIGHT");
	difficultyText.antialiasing = EngineSettings.antialiasing;
	add(difficultyText);
}

function update(elapsed:Float) {
	grid1.x = FlxMath.lerp(grid1.x, grid1.x + 10, boundTo(elapsed * 9, 0, 1));
	grid1.y = FlxMath.lerp(grid1.y, grid1.y - 10, boundTo(elapsed * 9, 0, 1));

	grid2.x = FlxMath.lerp(grid2.x, grid2.x - 5, boundTo(elapsed * 9, 0, 1));
	grid2.y = FlxMath.lerp(grid2.y, grid2.y + 2.5, boundTo(elapsed * 9, 0, 1));
}

function updatePost() {
	daNewScore.text = 'Score: ' + lerpScore;
	switch (_songs[curSelected].songName.toLowerCase()) {
		case "celebrate", "follow-me", "midnight", "you-can't":
			difficultyText.alpha = 1;
			difficultyText.text = diffText.text;
		default:
			difficultyText.alpha = 0.0001;
			difficultyText.text = "WAIT HOW TF CAN YOU SEE THIS?!?!?"; // sex, that's why -xav
	}
}

function boundTo(value:Float, min:Float, max:Float):Float {
	var newValue:Float = value;
	if (newValue < min)
		newValue = min;
	else if (newValue > max)
		newValue = max;
	return newValue;
}

var colorTween:ColorTween;

function onChangeSelection(curSelected) {
	if (colorTween == null) {
		colorTween = FlxTween.color(grid1, 1.5, grid1.color, _songs[curSelected].color, {ease: FlxEase.quintOut});
		colorTween = FlxTween.color(grid2, 1.5, grid2.color, _songs[curSelected].color, {ease: FlxEase.quintOut});
	} else {
		colorTween.cancel();
		colorTween = FlxTween.color(grid1, 1.5, grid1.color, _songs[curSelected].color, {ease: FlxEase.quintOut});
		colorTween = FlxTween.color(grid2, 1.5, grid2.color, _songs[curSelected].color, {ease: FlxEase.quintOut});
	}
	difficultyText.text = diffText.text;
	updateSongImage();
}

var canSelect:Bool = true;

function onSelect() {
	return canSelect;
}

function updateSongImage() {
	songImage.animation.play(_songs[curSelected].songName.toLowerCase());
	unlocked = true;
	// switch(_songs[curSelected].songName.toLowerCase())
	// {
	// 	case 'salvage':
	// 		unlocked = FlxG.save.data.springtrapUnlocked;
	// 	case 'nightmare':
	// 		unlocked = FlxG.save.data.salvageBeaten;
	// 	case 'umbra':
	// 		unlocked = FlxG.save.data.shadowBonnieUnlocked;
	// 	case 'just-a-theory':
	// 		unlocked = FlxG.save.data.matpatUnlocked;
	// 	case 'fourth-wall':
	// 		unlocked = FlxG.save.data.matpatBeaten;
	// 	case 'consequences':
	// 		unlocked = FlxG.save.data.omcUnlocked;
	// 	case 'fazbars':
	// 		unlocked = FlxG.save.data.fazbarsUnlocked;
	// }
}
