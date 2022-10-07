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

var three:FlxSound = null;
var ready:FlxSound = null;
var set:FlxSound = null;
var go:FlxSound = null;

function create() {
    blackScreen2 = new FlxSprite(-600, -400).makeGraphic(Std.int(FlxG.width * 5), Std.int(FlxG.height * 5), 0xFF000000);
    PlayState.add(blackScreen2);
    blackScreen2.alpha = 0;
    
    remove(blackScreen2);
    insert(100, blackScreen2);
    remove(boyfriend);
    insert(100, boyfriend);
    remove(dad);
    insert(100, dad);

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

function update() {
    PlayState.camFollow.y = 500;
    PlayState.camFollow.x = 600;
    FlxG.camera.focusOn(PlayState.camFollow.getPosition());
}

function onGenerateStaticArrows() {
    blackScreen1 = new FlxSprite(-600, -400).makeGraphic(Std.int(FlxG.width * 5), Std.int(FlxG.height * 5), 0xFF000000);
    PlayState.add(blackScreen1);

    scan = new FlxSprite(-30, -100).loadGraphic(Paths.image('stages/scanline'));
    scan.scale.set(2, 2);
    scan.cameras = [PlayState.camHUD];
    scan.updateHitbox();
    scan.alpha = 0.6;
    PlayState.add(scan);
}


function onCountdown(countdown:Int) {
    switch(countdown) {
        case 3:
            FlxG.sound.play(three);
        case 2:
            FlxG.sound.play(ready);

            var ready:FlxSprite = new FlxSprite().loadGraphic(Paths.image("weeb/pixelUI/ready-pixel"));
            ready.scrollFactor.set();
            ready.updateHitbox();
            ready.setGraphicSize(Std.int(ready.width * 3));
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
            set.setGraphicSize(Std.int(set.width * 3));
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
            date.setGraphicSize(Std.int(date.width * 3));
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

function onShowCombo(combo:Int, coolText:FlxText) {
    
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

function stepHit(curStep:Int) {
    if(curStep == 1) {
        blackScreen1.visible = false;
    }
    if(curStep == 960) {
        blackScreen2.alpha = 0.2;
    }
    if(curStep == 964) {
        blackScreen2.alpha = 0.25;
    }
    if(curStep == 968) {
        blackScreen2.alpha = 0.3;
    }
    if(curStep == 972) {
        blackScreen2.alpha = 0.35;
    }
    if(curStep == 976) {
        blackScreen2.alpha = 0.4;
    }
    if(curStep == 980) {
        blackScreen2.alpha = 0.45;
    }
    if(curStep == 984) {
        blackScreen2.alpha = 0.5;
    }
    if(curStep == 988) {
        blackScreen2.alpha = 0.55;
    }
    if(curStep == 992) {
        blackScreen2.alpha = 0.6;
    }
    if(curStep == 996) {
        blackScreen2.alpha = 0.65;
    }
    if(curStep == 1000) {
        blackScreen2.alpha = 0.7;
    }
    if(curStep == 1004) {
        blackScreen2.alpha = 0.75;
    }
    if(curStep == 1008) {
        blackScreen2.alpha = 0.8;
    }
    if(curStep == 1012) {
        blackScreen2.alpha = 0.85;
    }
    if(curStep == 1016) {
        blackScreen2.alpha = 0.9;
    }
    if(curStep == 1020) {
        blackScreen2.alpha = 1;
    }
    if(curStep == 1024) {
        blackScreen2.alpha = 0;
    }
}