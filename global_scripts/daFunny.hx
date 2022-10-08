//a
var songName = PlayState.song.song.toLowerCase();
var pixelatedYES:Bool = false;
var blackScreen1:FlxSprite;

function create() {

    switch(songName) {
      case "celebrate", "follow-me", "midnight", "you-can't":
        ratings = [
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
        },
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
        }
    ];
        pixelatedYES = true;

        bars = new FlxSprite(-30, -100).loadGraphic(Paths.image('stages/ac'));
        bars.antialiasing = EngineSettings.antialiasing;
        bars.scale.set(1, 1);
        bars.cameras = [PlayState.camHUD];
        bars.updateHitbox();
        PlayState.add(bars);

        three = Paths.sound("intro3-pixel");
        ready = Paths.sound("intro2-pixel");
        set = Paths.sound("intro1-pixel");
        date = Paths.sound("introGo-pixel");  
    }
}

function onGenerateStaticArrows() {
    if (pixelatedYES) {
        blackScreen1 = new FlxSprite(-600, -400).makeGraphic(Std.int(FlxG.width * 5), Std.int(FlxG.height * 5), 0xFF000000);
        PlayState.add(blackScreen1);
    
        scan = new FlxSprite(-30, -100).loadGraphic(Paths.image('stages/scanline'));
        scan.scale.set(2, 2);
        scan.cameras = [PlayState.camHUD];
        scan.updateHitbox();
        scan.alpha = 0.6;
        PlayState.add(scan);
    }
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
                    blackScreen1.visible = false;
                    date.destroy();
                }
            });
            
    }
    return false;
}
}

function musicstart() {
    trace("musicstart");
    if (pixelatedYES) {
        blackScreen1.visible = false;
    }
}
function onShowCombo(combo:Int, coolText:FlxText) {
    if (pixelatedYES) {
    
        if (!(combo >= 10 || combo == 0))
            return;

        var seperatedScore:Array<Int> = [];

        var stringCombo = Std.string(combo);
        for(i in 0...stringCombo.length) {
            seperatedScore.push(Std.parseInt(stringCombo.charAt(i)));
        }

        while(seperatedScore.length < 3) seperatedScore.insert(0, 0);


        var daLoop:Int = 0;
        for (i in seperatedScore)
        {
            var numScore:FlxSprite = new FlxSprite().loadGraphic(Paths.image('weeb/pixelUI/num' + Std.int(i) + '-pixel'));
            numScore.screenCenter();
            numScore.x = coolText.x + (68 * daLoop) - 90;
            numScore.y += 80;


            numScore.scale.set(2, 2);
            numScore.updateHitbox();

            numScore.acceleration.y = FlxG.random.int(200, 300);
            numScore.velocity.y -= FlxG.random.int(140, 160);
            numScore.velocity.x = FlxG.random.float(-5, 5);

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

        return false;
    }
}   