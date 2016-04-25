difference() {
	translate([0,0,0]) rotate([0,0,0]) cube ([10,80,20]);
	translate([2,0,2]) rotate([10,0,0]) cube ([6,80,20]);
	translate([-5,0,6]) rotate([15,0,0]) cube ([16,80,20]);
}
translate([-80,90,0]) rotate([0,0,-90]) {
	difference() {
	translate([0,0,0]) rotate([0,0,0]) cube ([10,80,20]);
	translate([2,0,2]) rotate([10,0,0]) cube ([6,80,20]);
	translate([-5,0,6]) rotate([15,0,0]) cube ([16,80,20]);
}
}

translate([90,80,0]) rotate([0,0,90]) {
	difference() {
	translate([0,0,0]) rotate([0,0,0]) cube ([10,80,20]);
	translate([2,0,2]) rotate([10,0,0]) cube ([6,80,20]);
	translate([-5,0,6]) rotate([15,0,0]) cube ([16,80,20]);
}
}

translate([10,170,0]) rotate([0,0,180]) {
	difference() {
	translate([0,0,0]) rotate([0,0,0]) cube ([10,80,20]);
	translate([2,0,2]) rotate([10,0,0]) cube ([6,80,20]);
	translate([-5,0,6]) rotate([15,0,0]) cube ([16,80,20]);
}
}

difference() {
	translate([4,85,0]) cylinder(r=8,h=30);
	translate([4,85,2]) cylinder(r=4.2,h=33);
	translate([4,85,24]) rotate([0,90,0]) cylinder(r=1.6,h=24);
	translate([8,82,22.5]) cube([3,6,40]);
}
