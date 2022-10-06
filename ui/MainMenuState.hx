//a
import flixel.effects.FlxFlicker;
import flixel.input.keyboard.FlxKey;

var selectedSomethin:Bool = false;\
var menuCurSelected:Int = 0;
var optionShit:Array<String> = ['afton', 'extras', 'options', 'credits'];

var menuItems:Array<FlxSprite> = [];
function create() {
}

var selectedSomethin:Bool = false;
function createPost() {
    
    state.defaultBehaviour = false;
    for (i in state.menuItems) {
        state.menuItems.remove(i);
    }

    state.bg.scale.set(1,1);
    state.bg.scrollFactor.set();

    wall = new FlxBackdrop(Paths.image('UI_Wall_Background'), 5, 1, true, true);
    wall.setPosition(0, -343);
    wall.scrollFactor.set();
    wall.updateHitbox();
    wall.velocity.set(-90,0);
    wall.antialiasing = EngineSettings.antialiasing;
    add(wall);

    var monitor:FlxSprite = new FlxSprite(-100, 0).loadGraphic(Paths.image('UI_Monitor'));
    monitor.setGraphicSize(Std.int(monitor.width * 1));
    monitor.scrollFactor.set();
    add(monitor);

    for (i in 0...optionShit.length) {
		var offsetY:Float = 400 - (Math.max(optionShit.length, 4) - 4) * 80;
		var menuItem:FlxSprite = new FlxSprite(130, (i * 50)  + offsetY).loadGraphic(Paths.image('mainmenu/menu_afton_' + optionShit[i]));
		menuItem.scrollFactor.set(0, 0);
		menuItem.antialiasing = EngineSettings.antialiasing;
		menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
		menuItem.updateHitbox();
		menuItem.ID = i;
        menuItems.push(menuItem);
		add(menuItems[i]);
	}

}

function update(elapsed:Float) {
    if (!selectedSomethin)
    {
        if (controls.UI_UP_P) {
            CoolUtil.playMenuSFX(0);
            changeItem(-1);
        }

        if (controls.UI_DOWN_P) {
            CoolUtil.playMenuSFX(0);
            changeItem(1);
        }

        if (controls.UI_LEFT_P)
            changeDiff(-1);

        if (controls.UI_RIGHT_P)
            changeDiff(1);

        if (controls.BACK) {
            selectedSomethin = true;
            FlxG.sound.play(Paths.sound('cancelMenu'));
            MusicBeatState.switchState(new TitleState());
        }

        if (controls.ACCEPT) {
                selectedSomethin = true;
                FlxG.sound.play(Paths.sound('confirmMenu'));

                for (i in menuItems) {
                    FlxFlicker.flicker(arrowMenu, 1, 0.06, false, false, function(flick:FlxFlicker) {
                        var daChoice:String = optionShit[menuCurSelected];
                        switch (daChoice) {
                            case 'afton':
                                playStory();
                            case 'extras':
                                FlxG.switchState(new FreeplayState());
                            case 'credits':
                                FlxG.switchState(new CreditsState());
                            case 'options':
                                FlxG.switchState(new options.screens.OptionMain());
                                    
                        }
                    });
                });
            }
        }
}

function playStory() {
    trace("not done yet lol");
}

function changeItem(huh:Int = 0) {
    
}