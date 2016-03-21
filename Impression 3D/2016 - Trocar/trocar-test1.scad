// Simple trocar for laparoscopic trainer
// Author: Francesco Grondona

difference() {
    union() {
        cylinder(h=15, d=6, center=true);
        cylinder(h=3, d=10, center=true);
        cylinder(h=6, d1=10, d2=6, center=true);
    }
    cylinder(h=20, d=5.2, center=true);
}