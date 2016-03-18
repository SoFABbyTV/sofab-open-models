$fn=60;
r=60; //rayon
h=50; //hauteur lame
nb=60; //nb lames
b=1; //épaisseur plateau
r2=r+h/2-1;
m=30;

translate([0,0,-h]) for ( i = [0 : nb] )
{
    rotate( i * 360 / nb, [0, 0, 1])
    translate([0,r, 0])
    rotate([0,0,45]) cube([0.7,30,h]);
}
difference() {
    cylinder(r=r2,h=b,center=true); //plateau
    translate([0,0,-m/2+1]) cylinder(r=2.5,m,center=true);
}

difference() {
    translate([0,0,-h]) cylinder(r=r2,h=b,center=true);
    translate([0,0,-h]) cylinder(r=0.95*r2,h=b+1,center=true);
}

y=50 ; //[0:100] //height of paraboloid
f=5;	//[0:100] //focus distance
fc=5;	// [1,0] //center paraboloid position
rfa=0 ;//[0:100] //radius of the focus area :
detail=120; //[44:240] // detail = $fn of cone


module paraboloid (y, f, rfa, fc, detail){
	// y = height of paraboloid
	// f = focus distance 
	// fc : 1 = center paraboloid in focus point(x=0, y=f); 0 = center paraboloid on top (x=0, y=0)
	// rfa = radius of the focus area : 0 = point focus
	// detail = $fn of cone

	hi = (y+2*f)/sqrt(2);								// height and radius of the cone -> alpha = 45° -> sin(45°)=1/sqrt(2)
	x =2*f*sqrt(y/f);									// x  = half size of parabola
	
   translate([0,0,-f*fc])								// center on focus 
	rotate_extrude(convexity = 10,$fn=detail )		// extrude paraboild
	translate([rfa,0,0])								// translate for fokus area	 
	difference(){
		union(){											// adding square for focal area
			projection(cut = true)																			// reduce from 3D cone to 2D parabola
				translate([0,0,f*2]) rotate([45,0,0])													// rotate cone 45° and translate for cutting
				translate([0,0,-hi/2])cylinder(h= hi, r1=hi, r2=0, center=true, $fn=detail);   	// center cone on tip
			translate([-(rfa+x ),0]) square ([rfa+x , y ]);											// focal area square
		}
		translate([-(2*rfa+x ), -1/2]) square ([rfa+x ,y +1] ); 					// cut of half at rotation center 
	}
}

paraboloid (y, f, rfa, fc, detail);



