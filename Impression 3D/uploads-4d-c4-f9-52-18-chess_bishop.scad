segments = 64;

scale(0.2)
rotate([0, 0, 0])
translate([0, 0, 0]) {

translate([0, 0, 222])
difference () {
    rotate_extrude(convexity = 10, $fn = segments) {
	import_dxf(file = "bishop_profile.dxf");
    }
    translate([-30, 0, 5])
    rotate([0, -45, 0])
    cube([10, 80, 80], center = true);
}

}
