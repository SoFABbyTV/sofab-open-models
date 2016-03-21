// Simple trocar for laparoscopic trainer
// Author: Francesco Grondona
// Description: the trocar is designed to fit into the hole of a latex washer, cone shaped side eases its insertion. Diameter of washer thickness, laparoscopy tool, relevant clearance and pipe wall thickness can be customized.
// Note: terms "upper" and "lower" refer to the use of the tool; the drawing is reversed to allow 3D printing.

// customizable params
washerThickness=5;
toolDiameter=5;
holeClearance=0.2;
wallThickness=1;

innerDiameter=toolDiameter+holeClearance;
outerDiameter=innerDiameter+2*wallThickness;
stopDiameter=outerDiameter+6;

difference() {
    union() {
        // main pipe
        translate([0,0,5]){
            cylinder(h=10+washerThickness, d=outerDiameter, center=false);
        }
        // upper stop
        translate([0,0,-5]){
            cylinder(h=2, d=stopDiameter, center=true);
        }
        // lower stop/cone
        translate([0,0,5]){
            cylinder(h=5, d1=stopDiameter, d2=outerDiameter, center=true);
        }
    }
    // center hole
    cylinder(h=20, d=innerDiameter, center=true);
}