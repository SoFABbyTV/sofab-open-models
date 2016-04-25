//coulisseau

difference() {
	union() {
		translate([0,-2.5,0]) cube([28,5,24]);
		translate([0,0,12]) cylinder(r=9.8,h=24,center=true);
	}
translate([0,0,12]) cylinder(r=7.7,h=32,center=true);
translate([-10,-0,-2]) cube([40,20,32]);
translate([10,-5,3.5]) cube([1,10,3]);
translate([10,-5,17.5]) cube([1,10,3]);

translate([24,6,20]) rotate([90,0,0]) cylinder(r=2,h=10); //trou fil
}




