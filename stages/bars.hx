//a
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
//a
var fazIP:Array<FlxText> = [];

function createPost() {
	PlayState.iconP1.antialiasing = PlayState.iconP2.antialiasing = PlayState.dad.antialiasing = PlayState.boyfriend.antialiasing = false;
}

function stepHit(curStep) {
	if (curStep == 1399) {
		fuckYouIPADRESS();
	}
}

function fuckYouIPADRESS() {
	for (i in 0...7){
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
		if(i != 3) {
			fazIP.push(dots);
			add(fazIP[i]);
		}
		dots.cameras = [camHUD];
	}
}
function onCountdown(val:Int) {
	switch(val) {
		case 3:
			FlxG.sound.play(Paths.sound('intro3'), 0.6);
		case 2:
			var ready:FlxSprite = new FlxSprite().loadGraphic(Paths.image("stages/fazbars/ready"));
			ready.scrollFactor.set();
			ready.updateHitbox();

			ready.cameras = [camHUD];
			ready.screenCenter();
			add(ready);
			FlxTween.tween(ready, {y: ready.y += 100, alpha: 0}, Conductor.crochet / 1000, {
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
			FlxTween.tween(set, {y: set.y += 100, alpha: 0}, Conductor.crochet / 1000, {
				ease: FlxEase.cubeInOut,
				onComplete: function(twn:FlxTween) {
					set.destroy();
				}
			});
			FlxG.sound.play(Paths.sound('intro1'), 0.6);
		case 0:
			var go:FlxSprite = new FlxSprite().loadGraphic(Paths.image("stages/fazbars/go"));
			go.scrollFactor.set();

			go.updateHitbox();

			go.cameras = [camHUD];
			go.screenCenter();
			add(go);
			FlxTween.tween(go, {y: go.y += 100, alpha: 0}, Conductor.crochet / 1000, {
				ease: FlxEase.cubeInOut,
				onComplete: function(twn:FlxTween) {
					go.destroy();
				}
			});
			FlxG.sound.play(Paths.sound('introGo'), 0.6);
	}
	return false;
}