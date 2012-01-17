#declare w = 640;
#declare h = 960;
#declare wi = 114;

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

/*
#declare im = box {
  <-w, -h, 0>/2,
  <w, h, 1>/2
  translate z*0.001
  pigment {
  	image_map{png "bg.png"}
  	scale <w, h>
  	translate <w,h>/2
  }
}
im
*/

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

#macro cc(ss, vv)
object {
	c
	scale ss
	translate vv - <w, h, 0>/2 + <wi, wi>/2
}
#end

#macro row(yy)
cc(1.05, <34, yy>)
cc(1.05, <186, yy>)
cc(1.05, <340, yy>)
cc(1.05,  <492, yy>)
#end


row(776.5)
row(601)
row(424)
row(248.5)
row(40.5)



//sdfdfa