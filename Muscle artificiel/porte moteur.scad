difference() {
	union(){
		cylinder(r=26,h=40,center=true);
		translate([0,-28,0]) cube([20,14,40],center=true);
	}
	translate([0,0,-1])cylinder(r=19,h=48,center=true);
	translate([0,-28,-1]) cube([6,28,48],center=true);
	translate([0,-24,-1])cylinder(r=5.2,h=60,center=true);
	translate([0,-30,12])rotate([0,90,0])cylinder(r=1.6,h=60,center=true);
	translate([0,-30,-12])rotate([0,90,0])cylinder(r=1.6,h=60,center=true);

}
