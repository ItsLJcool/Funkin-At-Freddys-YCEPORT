//a
function create() {
    afton = new FlxSprite(350, 225);
    afton.frames = Paths.getSparrowAtlas('aftonTitle');
    afton.animation.addByIndices('idle', 'aftonTitle idle', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
    afton.animation.addByIndices('spook', 'aftonTitle splush', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
    afton.antialiasing = true;
    afton.animation.play('idle');
    afton.scale.set(2,2);
    add(afton);

    aftonGlitch();

    title = new FlxSprite(200,200).loadGraphic(Paths.image('funkinFred'));
    title.antialiasing = EngineSettings.antialiasing;
    title.scale.set(1,1);
    title.updateHitbox();
    add(title);

    stat = new FlxSprite(0,0);
    stat.frames = Paths.getSparrowAtlas('static');
    stat.animation.addByPrefix('static', 'idle', 24, true);
    stat.animation.play('static');
    stat.antialiasing = EngineSettings.antialiasing;
    stat.scale.set(1,1);
    stat.alpha=0.2;
    stat.updateHitbox();
    add(stat);
}

//yoink
// youink? theres a source code?
function aftonGlitch() {
	var aftonSpooky:Float = FlxG.random.float(2.0, 5.0);
	new FlxTimer().start(aftonSpooky, function(tmr:FlxTimer) {
		afton.animation.play('spook');
		new FlxTimer().start(0.1, function(tmr:FlxTimer) {
			afton.animation.play('idle');
			aftonGlitch();
		});
	});
}