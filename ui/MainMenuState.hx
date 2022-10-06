//a

// keys cool
var controls = FlxG.keys.pressed;
var controlsJust = FlxG.keys.justPressed;
var controlsJustNUM = FlxControls.anyJustPressed;
var controlsNUM = FlxControls.anyPressed;

var selectedSomethin:Bool = false;
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
}