$fn=30;
difference() {
    union() {
        translate([-10,-6,0]) cube([32,12,1]);

        translate([12,0,0]) cylinder(r1=5,r2=3,h=12);

    }

translate([-5,0,-1]) cylinder(r=1.6,h=12);
translate([12,0,-1]) cylinder(r=3.6,h=4);
    translate([12,0,-1]) cylinder(r=1,h=20);
    translate([6,-6,12]) rotate([0,90,90]) cylinder(r=6.5,h=12);
translate([18,-6,12]) rotate([0,90,90]) cylinder(r=6.5,h=12);

}
