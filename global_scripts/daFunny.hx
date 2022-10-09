//a
var songName = PlayState.song.song.toLowerCase();
var pixelatedYES:Bool = false;
var realzFnaf3:Bool = false;
var blackScreen1:FlxSprite;

function create() {

    switch(songName) {
        case "celebrate", "follow-me", "midnight", "you-can't", "umbra":
            pixelatedYES = true;

            arcadeoverlay = new FlxSprite(0, 0).loadGraphic(Paths.image('stages/ac'));
            arcadeoverlay.antialiasing = false;
            arcadeoverlay.setGraphicSize(Std.int(arcadeoverlay.width * 1));
            arcadeoverlay.updateHitbox();
            arcadeoverlay.screenCenter();
            arcadeoverlay.y -= 30;
            if (songName != "umbra") PlayState.add(arcadeoverlay);
            arcadeoverlay.cameras = [PlayState.camHUD];

            three = Paths.sound("intro3-pixel");
            ready = Paths.sound("intro2-pixel");
            set = Paths.sound("intro1-pixel");
            date = Paths.sound("introGo-pixel");
        case "salvage", "nightmare":
            realzFnaf3 = true;
    }

    if (pixelatedYES) {
        ratings = [
        {
            name : "Party!!",
            image : "Funkin' At Freddy's:weeb/pixelUI/sick-pixel",
            accuracy : 1,
            health : 0.10,
            maxDiff : 50,
            score : 350,
            scale : 3,
            color : "#24DEFF",
            antialiasing : false                                                                                                                                                                     
        },
        {
            name : "Great",
            image : "Funkin' At Freddy's:weeb/pixelUI/good-pixel",
            accuracy : 2 / 3,
            health : 0.06,
            maxDiff : 100,
            score : 200,
            scale : 3,
            color : "#3FD200",
            antialiasing : false
        },
        {
            name : "Good",
            image : "Funkin' At Freddy's:weeb/pixelUI/bad-pixel",
            accuracy : 1 / 3,
            health : 0.0,
            maxDiff : 150,
            score : 50,
            scale : 3,
            color : "#D70000",
            antialiasing : false
        },
        {
            name : "Terrible",
            image : "Funkin' At Freddy's:weeb/pixelUI/shit-pixel",
            accuracy : 1 / 6,
            health : 0.0,
            maxDiff : 1000,
            score : -150,
            scale : 3,
            color : "#804913",
            miss : true,
            antialiasing : false
        }
    ];
    }

    if (save.data.developerMode == null) {
        save.data.developerMode = false;
        save.flush();
    }
    trace("developerMode: " + save.data.developerMode);
}

function onGenerateStaticArrows() {
    if (pixelatedYES) {
        blackScreen1 = new FlxSprite(0,0).makeGraphic(Std.int(FlxG.width * 5), Std.int(FlxG.height * 5), 0xFF000000);
        blackScreen1.screenCenter();
        PlayState.add(blackScreen1);
    
        scan = new FlxSprite(-30, -100).loadGraphic(Paths.image('stages/scanline'));
        scan.scale.set(2, 2);
        scan.cameras = [PlayState.camHUD];
        scan.updateHitbox();
        scan.alpha = 0.6;
        PlayState.add(scan);

        camHUD.alpha = 0.0001;
    }
}

function onGuiPopup() {
    if (songName == "umbra") {
        PlayState.healthBar.visible = false;
        PlayState.healthBarBG.visible = false;
        PlayState.iconP1.visible = false;
        PlayState.iconP2.visible = false;
    }
}

// keys cool
var controls = FlxG.keys.pressed;
var controlsJust = FlxG.keys.justPressed;
var controlsJustNUM = FlxControls.anyJustPressed;
var controlsNUM = FlxControls.anyPressed;
function update() {
    if (save.data.developerMode && controlsJust.B)
        EngineSettings.botplay = !EngineSettings.botplay;
    if (save.data.developerMode && controlsJustNUM([27]))
        FlxG.switchState(new FreeplayState());
}

function onCountdown(countdown:Int) {
    if (pixelatedYES) {
    switch(countdown) {
        case 3:
            FlxG.sound.play(three);
        case 2:
            FlxG.sound.play(ready);

            var ready:FlxSprite = new FlxSprite().loadGraphic(Paths.image("weeb/pixelUI/ready-pixel"));
            ready.scrollFactor.set();
            ready.updateHitbox();
            ready.setGraphicSize(Std.int(ready.width * 1));
            ready.screenCenter();
            PlayState.add(ready);

            FlxTween.tween(ready, {y: ready.y += 100, alpha: 0}, Conductor.crochet / 1000, {
                ease: FlxEase.cubeInOut,
                onComplete: function(twn:FlxTween)
                {
                    ready.destroy();
                }
            });

        case 1:
            FlxG.sound.play(set);

            var set:FlxSprite = new FlxSprite().loadGraphic(Paths.image("weeb/pixelUI/set-pixel"));
            set.scrollFactor.set();
            set.updateHitbox();
            set.setGraphicSize(Std.int(set.width * 1));
            set.screenCenter();
            PlayState.add(set);

            FlxTween.tween(set, {y: set.y += 100, alpha: 0}, Conductor.crochet / 1000, {
                ease: FlxEase.cubeInOut,
                onComplete: function(twn:FlxTween)
                {
                    set.destroy();
                }
            });
        case 0:
            FlxG.sound.play(date);

            var date:FlxSprite = new FlxSprite().loadGraphic(Paths.image("weeb/pixelUI/date-pixel"));
            date.scrollFactor.set();
            date.updateHitbox();
            date.setGraphicSize(Std.int(date.width * 1));
            date.screenCenter();
            PlayState.add(date);

            FlxTween.tween(date, {y: date.y += 100, alpha: 0}, Conductor.crochet / 1000, {
                ease: FlxEase.cubeInOut,
                onComplete: function(twn:FlxTween)
                {
                    date.destroy();
                }
            });
            
        }
        return false;
    }
    if (realzFnaf3) {
        switch(countdown) {
            case 3:
            case 2:
            case 1:
            case 0:
        }
        return false;
    }
}

function musicstart() {
    trace("musicstart");
    if (pixelatedYES) {
        if (songName == "midnight" || songName == "you-can't")
            blackScreen1.alpha = 0.6;
        else
            blackScreen1.visible = false;
        trace(blackScreen1.alpha);
        trace(blackScreen1.visible);
        camHUD.alpha = 1;
    }
}

function onShowCombo(combo:Int, coolText:FlxPoint) {
    if (pixelatedYES && songName != 'umbra') {
        var seperatedScore:Array<Int> = [];

        var stringCombo = Std.string(combo);
        for(i in 0...stringCombo.length) {
            seperatedScore.push(Std.parseInt(stringCombo.charAt(i)));
        }

        coolText.x = -99999999;
        while(seperatedScore.length < 3) seperatedScore.insert(0, 0);

        var daLoop:Int = 0;
        for (i in seperatedScore) {
            var numScore:FlxSprite = new FlxSprite().loadGraphic(Paths.image('weeb/pixelUI/num' + Std.int(i) + '-pixel'));
            numScore.screenCenter(FlxAxes.X);
            numScore.x += -49 + (10 + numScore.width) * daLoop;
            numScore.y = 100;
            numScore.cameras = [PlayState.camHUD];

            if(EngineSettings.middleScroll){
                numScore.x -= 400;
            }
            if(EngineSettings.downscroll){
                numScore.y = 650;
            }

            numScore.updateHitbox();
            PlayState.add(numScore);

            FlxTween.tween(numScore, {alpha: 0}, 0.2, {
                onComplete: function(tween:FlxTween)
                {
                    numScore.destroy();
                },
                startDelay: Conductor.crochet * 0.002
            });

            daLoop++;
        }
    }
    else if (pixelatedYES && songName == "umbra")
        coolText.x = -99999999;
}