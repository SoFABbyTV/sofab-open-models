// Simple trocar for laparoscopic trainer
// Author: Francesco Grondona
// Description: the trocar is designed to fit into the hole of a latex washer, cone shaped side eases its insertion.
// Note: terms "upper" and "lower" refer to the use of the tool; the drawing is reversed to allow 3D printing.

// customizable params
washerThickness=5;
toolDiameter=5;
holeClearance=0.2;
wallThickness=1;
stopThickness=2;
coneThickness=5;

innerDiameter=toolDiameter+holeClearance;
outerDiameter=innerDiameter+2*wallThickness;
stopDiameter=outerDiameter+6;

difference() {
    union() {
        // main pipe
        cylinder(h=5+washerThickness+stopThickness+coneThickness, d=outerDiameter, center=false);
        // upper stop
        cylinder(h=stopThickness, d=stopDiameter, center=false);
        // lower cone
        translate([0,0,stopThickness+washerThickness]){
            cylinder(h=coneThickness, d1=stopDiameter, d2=outerDiameter, center=false);
        }
    }
    // center hole
    cylinder(h=20, d=innerDiameter, center=false);
}