
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
