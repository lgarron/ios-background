#declare w = 640;
#declare h = 960;
#declare wi = 114;

#declare BG = true;

background {
	rgb 1
}

camera {
	angle 1
	location <0, 0, -h*38.2>
	look_at 0
	right x*w/h
}

light_source {
	<-100000, 200000, -150000>
	rgb 0.5
}

light_source {
	<300000, -500000, -150000>
	rgb 0.5
}

#if (BG)

  box {
    <-w, -h, 0>/2,
    <w, h, 1>/2
    translate z*0.001
    pigment {
    	image_map{png "bg.png"} // Screenshot of home screen for overlay.
    	scale <w, h>
    	translate <w,h>/2
    }
  }

#end

#declare c = superellipsoid{
	<0.3,0.01>
	rotate z*90
	scale <wi, wi, 2000000>/2
	translate z*1000000
	translate y*2
	pigment{rgb <1, 1, 1>}
	finish{specular 0.5 roughness 0.1 ambient 0.5}
	no_shadow
}

#macro cc(ss, vv, col)
object {
	c
	scale ss
	translate vv - <w, h, 0>/2 + <wi, wi>/2
	pigment{rgb col}
}
#end

#macro row(yy, c1, c2, c3, c4)
cc(1.05, <34, yy>, c1)
cc(1.05, <186, yy>, c2)
cc(1.05, <340, yy>, c3)
cc(1.05,  <492, yy>, c4)
#end


// All columns white.
row(776.5, 1, 1, 1, 1)
row(601  , 1, 1, 1, 1)
row(424  , 1, 1, 1, 1)
row(248.5, 1, 1, 1, 1)
row( 40.5, 1, 1, 1, 1)


// Custom colors.
/*
row(776.5, y, 1, z, x+y/2)
row(601  , y, 1, z, x+y/2)
row(424  , y, 1, z, 0.5)
row(248.5, y, 1, z, 0.5)
row( 40.5, y, 0.5, z, 0.5)
*/

