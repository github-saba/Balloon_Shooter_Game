
// Actions for frame1 of layer1
function createballoon(n) {

        // create a new movie clip
        this.createEmptyMovieClip("balloon"+n,n);
        mc = this["balloon"+n];
        
        // set the line style to hailine, black, no-transparent
        mc.lineStyle(1,0x000000,100);
        
        // pick random number of balloon radius
       balloonradius = Math.random()*10+10; // 10 to 19
        
        // create balloon outline
        arcangle = 0;
        x = balloonradius*Math.cos(arcangle);
        y = balloonradius*Math.sin(arcangle);
        mc.beginFill(0xFF0000);
        mc.moveTo(x,y);

        for(var i=1;i<25;i++) {
              arcangle = 2.0*Math.PI*i/24;
              x = balloonradius*Math.cos(arcangle);
              y = balloonradius*Math.sin(arcangle);
              mc.lineTo(x,y);
        }
        mc.endFill();
        // return reference to this movie clip
        return(mc);
}

function initializeballoon(n) {
            // remember number of balloons
            numballoons = n;

            // create each balloon
            for(var i=0;i<numballoons;i++) {

                    // create balloon
                    mc = createballoon(i);
        
                    // set position
                    mc._x = Math.random()*530+10; //10 to 540
                    mc._y = 400; // bottom line
        
                    // set balloon speed
                    mc.speed = Math.random()*1+2; // 2 to 3
            }
}

function moveballoon() {
            // loop through balloons
            for(var i=0;i<numballoons;i++) {

                  // move the balloon
                  mc = this["balloon"+i];
                  mc._y -= mc.speed;
                  mc._x += 0;

                  // bring balloon back to bottom after reached top or after blown
                  if (mc._y <0) {
                        mc._y = 500;
                        mc._x = Math.random()*530+10; //10 to 540
                  }
          }
}

// create 50 balloons
initializeballoon(3);
stop();

// Actions for Gun
onClipEvent(load) {
      this._x = 275;
      this._y = 200;
      x = this._x;
      y = this._y;
      speed = 12;
      _global.blownballoons = 0; // Variable for Counting of blown Balloons
}

onClipEvent(enterFrame) {
      if (Key.isDown(Key.LEFT)) {
          if (this._x > 0) x -= speed;
      }
      if (Key.isDown(Key.RIGHT)) {
          if (this._x < 550) x += speed;
      }
      if (Key.isDown(Key.UP)) {
          if (this._y > 0) y -= speed;
      }
      if (Key.isDown(Key.DOWN)) {
          if (this._y < 400) y += speed;
      }
      this._x = x;
      this._y = y;

      if (Key.isDown(Key.SPACE)) {
            if (this.hitTest(_parent.balloon0._x, _parent.balloon0._y)) {
                _parent.balloon0._y = -10;
                _global.blownballoons++;
            }
            if (this.hitTest(_parent.balloon1._x, _parent.balloon1._y)) {
                _parent.balloon1._y = -10;
                _global.blownballoons++;
            }
            if (this.hitTest(_parent.balloon2._x, _parent.balloon2._y)) {
                _parent.balloon2._y = -10;
                _global.blownballoons++;
            }
      }
}
