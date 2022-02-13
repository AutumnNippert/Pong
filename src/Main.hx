import h3d.pass.Blur;

class Main extends hxd.App {
	var window:hxd.Window;
	var lPaddle:h2d.Graphics;
	var rPaddle:h2d.Graphics;
	var ball:h2d.Graphics;
	var interaction:h2d.Interactive;

    var paddleHeight:Float;
    var paddleWidth:Float;
    var ballRadius:Float;
	override function init() {
        //DECLARING VARIABLES
        paddleHeight = super.s2d.height / 6.0;
        paddleWidth = 20.0;

		// Creating ball
		var ball = new h2d.Graphics(s2d);
		ball.beginFill(0xFFFFFF, 1);
		ball.drawCircle(100, 100, 15);
		ball.endFill();

		// ADDING TEXT
		var font:h2d.Font = hxd.res.DefaultFont.get();
		var tf = new h2d.Text(font);
		tf.text = "Hello World\nHeaps is great!";
		tf.textAlign = Left;

		// ADDING LEFT PADDLE
        // y is at the top left of the rectangle
        lPaddle = new h2d.Graphics(s2d);

        lPaddle.x = 20;
        lPaddle.y = s2d.height/2 - paddleHeight/2;
        drawPaddle(lPaddle, lPaddle.x, lPaddle.y);
        

		interaction = new h2d.Interactive(300, 100, lPaddle);

		// ADDING FILTERS
		//lPaddle.filter = new h2d.filter.Blur();
		ball.filter = new h2d.filter.Bloom();
		ball.filter = new h2d.filter.Blur();

		hxd.Window.getInstance().addEventTarget(onEvent);

		// For keypresses
		hxd.Key.ALLOW_KEY_REPEAT = true;
	}

	// INTERACTIONS AND EVENTS
	function onEvent(event:hxd.Event) {
		switch (event.kind) {
			case EKeyDown:
				trace('DOWN keyCode: ${event.keyCode}, charCode: ${event.charCode}');
			case EKeyUp:
				trace('UP keyCode: ${event.keyCode}, charCode: ${event.charCode}');
			case _:
		}
	}

	// on each frame
	override function update(dt:Float) {
        drawPaddle(lPaddle, lPaddle.x, lPaddle.y);
		if (hxd.Key.isDown(hxd.Key.W)) {
			trace("Pressed W");
            trace(lPaddle.y);
			if (lPaddle.y > 0) {
				lPaddle.y -= 10;
			}
		} else if (hxd.Key.isDown(hxd.Key.S)) {
			trace("Pressed S");
			if ((lPaddle.y + paddleHeight) < s2d.height) {
                lPaddle.y += 10;
			}
		}
	}

    function drawPaddle(paddle:h2d.Graphics, x:Float, y:Float) {
		paddle.beginFill(0xFFFFFF, 1);
		paddle.drawRect(x, y, paddleWidth, paddleHeight);
		paddle.endFill();
    }

	static function main() {
		new Main();
	}
}
