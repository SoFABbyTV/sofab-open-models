// Simple trocar for laparoscopic trainer
// Author: Francesco Grondona
// Description: the trocar is designed to fit into the hole of a latex washer, cone shaped side eases its insertion. Diameter of laparoscopy tool, relevant clearance and pipe wall thickness can be customized.

// customizable params
toolDiameter=5;
holeClearance=0.2;
wallThickness=1;

innerDiameter=toolDiameter+holeClearance;
outerDiameter=innerDiameter+2*wallThickness;

difference() {
    union() {
        // main pipe
        cylinder(h=15, d=outerDiameter, center=true);
        // upper stop
        translate([0,0,-5]){
            cylinder(h=3, d=12, center=true);
        }
        // lower stop/cone
        translate([0,0,5]){
            cylinder(h=5, d1=12, d2=6, center=true);
        }
    }
    // center hole
    cylinder(h=20, d=innerDiameter, center=true);
}