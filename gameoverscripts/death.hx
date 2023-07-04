import Sys;


function create() {
    FlxG.sound.play(Paths.music("death"), 1, true);

    retry = new FlxSprite(0, 0);
    retry.frames = Paths.getSparrowAtlas('retry');
    retry.animation.addByPrefix('retry', "retry retry", 16);
    retry.animation.addByPrefix('menu', "retry menu", 16);
    retry.animation.addByPrefix('static', "retry idle", 16);
    retry.animation.play('static');
    retry.antialiasing = true;
    retry.screenCenter();
    retry.scrollFactor.set(0,0);
    // retry.alpha = 0.7;
    add(retry);
    
    stat = new FlxSprite(0, 0);
    stat.frames = Paths.getSparrowAtlas('static');
    stat.animation.addByPrefix('static', "idle", 24);
    stat.animation.play('static');
    stat.antialiasing = true;
    stat.screenCenter();
    stat.scrollFactor.set(0,0);
    stat.blend = 14;
    stat.alpha = 0.7;
    add(stat);
}

function update() {
    FlxG.sound.music.stop();
    var rand = FlxG.random.int(0, 99999);

    switch(rand) {
        case 87:
            FlxG.sound.play(Paths.sound("undie"), 0.05);
        case 83:
            FlxG.sound.play(Paths.sound("freddy"), 0.08);
        case 1:
            FlxG.sound.play(Paths.sound("hello"), 0.08);
        case 97:
            FlxG.sound.play(Paths.sound("kidnapped"), 0.3);
        case 2000:
            FlxG.sound.play(Paths.sound("bb"), 0.3);
    }

    if(FlxG.keys.justPressed.ENTER) {
        FlxG.sound.play(Paths.sound("undie"), 1);
        retry.animation.play('retry');
    } else if (FlxG.keys.justPressed.BACKSPACE) {
        FlxG.sound.play(Paths.sound("hello"), 1);
        retry.animation.play('menu');
    }
}
