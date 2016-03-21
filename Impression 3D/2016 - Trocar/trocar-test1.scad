// Simple trocar for laparoscopic trainer
// Author: Francesco Grondona

difference() {
    union() {
        // main pipe
        cylinder(h=15, d=6, center=true);
        // upper stop
        translate([0,0,-5]){
            cylinder(h=3, d=12, center=true);
        }
        // upper stop/cone
        translate([0,0,5]){
            cylinder(h=5, d1=12, d2=6, center=true);
        }
    }
    // center hole
    cylinder(h=20, d=5.2, center=true);
}