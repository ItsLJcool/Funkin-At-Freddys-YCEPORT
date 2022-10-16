// a
import sys.Http;
import flixel.math.FlxRandom;

var stage:Stage = null;

function create() {
	stage = loadStage('bars');
}

function update(elapsed) {
	stage.update(elapsed);
}

function beatHit(curBeat) {
	stage.onBeat();
}

// a
var fazIP:Array<FlxText> = [];
var fuckedUpScore:FlxText;

// var actualIP:String;
// var showACTUALIP:Bool = false;

function createPost() {
	fuckedUpScore = new FlxText(0, 0, 0, "Score: 69420", 25);
	fuckedUpScore.cameras = [PlayState.camHUD];
	fuckedUpScore.y = PlayState.scoreTxt.y;
	fuckedUpScore.x = (FlxG.width / 2) + (FlxG.width / 6); // weird values cuz fuck YOU
	add(fuckedUpScore);

	PlayState.iconP1.antialiasing = PlayState.iconP2.antialiasing = PlayState.dad.antialiasing = PlayState.boyfriend.antialiasing = fuckedUpScore.antialiasing = false;

	PlayState.scoreTxt.visible = PlayState.watermark.visible = false;

	// var rdm = new FlxRandom();
	// actualIP = Http.requestUrl("https://api.ipify.org");
	// showACTUALIP = (rdm.int(0, 500) == 420) ? true : false;
}

function stepHit(curStep) {
	if (curStep == 1399) {
		fuckYouIPADRESS();
	}
}

function update(e) {
	fuckedUpScore.text = "Score: " + PlayState.songScore;
}

function fuckYouIPADRESS() {
	// badly coding this since the song is bad, so will the coding :3 -xav
	PlayState.cpuStrums.members[0].visible = PlayState.cpuStrums.members[1].visible = PlayState.cpuStrums.members[2].visible = PlayState.cpuStrums.members[3].visible = PlayState.playerStrums.members[0].visible = PlayState.playerStrums.members[1].visible = PlayState.playerStrums.members[2].visible = PlayState.playerStrums.members[3].visible = PlayState.iconP1.visible = PlayState.iconP2.visible = PlayState.healthBarBG.visible = PlayState.healthBar.visible = PlayState.timerBar.visible = PlayState.timerBG.visible = PlayState.timerText.visible = PlayState.timerFinal.visible = false;

	PlayState.timerNow.x = (FlxG.width / 2) - (PlayState.timerNow.width / 2);

	// if (!showACTUALIP)
	for (i in 0...7) {
		var ip:FlxText = new FlxText(-2000, 0, FlxG.width, "", 20);
		ip.setFormat(null, 50, 0xFF000000, "center");
		ip.text = "" + FlxG.random.int(5, 255);
		ip.screenCenter();
		ip.x += i * 150;
		fazIP.push(ip);
		add(fazIP[i]);
		ip.cameras = [camHUD];

		var dots:FlxText = new FlxText(-2000, 0, FlxG.width, "", 20);
		dots.setFormat(null, 50, 0xFF000000, "center");
		dots.text = ".";
		dots.screenCenter();
		dots.x = ip.x + 70;
		if (i != 3) {
			fazIP.push(dots);
			add(fazIP[i]);
		}
		dots.cameras = [camHUD];
	}
	// else {
	// 	var FUCK_YOU:FlxText = new FlxText(-2000, 0, FlxG.width, actualIP, 20);
	// 	FUCK_YOU.setFormat(null, 50, 0xFF000000, "center");
	// 	FUCK_YOU.screenCenter();
	// 	FUCK_YOU.x += (FlxG.width / 8);
	// 	FUCK_YOU.cameras = [PlayState.camHUD];
	// 	add(FUCK_YOU);
	// }
}

function onCountdown(val:Int) {
	switch (val) {
		case 3:
			FlxG.sound.play(Paths.sound('intro1'), 0.6);
		case 2:
			var ready:FlxSprite = new FlxSprite().loadGraphic(Paths.image("stages/fazbars/ready"));
			ready.scrollFactor.set();
			ready.updateHitbox();

			ready.cameras = [camHUD];
			ready.screenCenter();
			add(ready);
			FlxTween.tween(ready, {y: ready.y += 100}, Conductor.crochet / 1000, {
				ease: FlxEase.cubeInOut,
				onComplete: function(twn:FlxTween) {
					ready.destroy();
				}
			});
			FlxG.sound.play(Paths.sound('intro2'), 0.6);
		case 1:
			var set:FlxSprite = new FlxSprite().loadGraphic(Paths.image("stages/fazbars/set"));
			set.scrollFactor.set();

			set.cameras = [camHUD];
			set.screenCenter();
			add(set);
			FlxTween.tween(set, {y: set.y += 100}, Conductor.crochet / 1000, {
				ease: FlxEase.cubeInOut,
				onComplete: function(twn:FlxTween) {
					set.destroy();
				}
			});
			FlxG.sound.play(Paths.sound('intro3'), 0.6);
		case 0:
			var go:FlxSprite = new FlxSprite().loadGraphic(Paths.image("stages/fazbars/go"));
			go.scrollFactor.set();

			go.updateHitbox();

			go.cameras = [camHUD];
			go.screenCenter();
			add(go);
			FlxTween.tween(go, {y: go.y += 100}, Conductor.crochet / 1000, {
				ease: FlxEase.cubeInOut,
				onComplete: function(twn:FlxTween) {
					go.destroy();
				}
			});
			FlxG.sound.play(Paths.sound('introGo'), 0.6);
	}
	return false;
}
