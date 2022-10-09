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
}

function stepHit(curStep:Int) {
    switch(curStep){
        case 1024:
            blackScreen2.alpha = 0;
    }
}

function setAlpha(?reset:Int = 1) {
    blackScreen2.alpha += 0.1;
    if (reset != null)
        blackScreen2.alpha = 1;
}