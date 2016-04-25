
include <dimensions.scad>

included=false; // this value will be overriden in the including file
included_in_attache=false; // this value will be overriden in the including file
included_in_sommet=false; // this value will be overriden in the including file


module balle()
{
    sphere(d=d);
}

module cubes_montants() 
{
    translate ([d/2+e+jeu/2-l_m/2,-d/2-e-jeu/2,0]) 
        cube([l_m,d+2*e+jeu, h_m+encastrement]);
    translate ([3*d/2+2*e+jeu/2-l_m/2,-d/2-e-jeu/2,0]) 
        cube([l_m,d+2*e+jeu, h_m+encastrement]);
}


module montants() {
    intersection () {
        difference() {
            enveloppe_ext(hull=false);
            enveloppe_int(hull=true);
        }
        cubes_montants();
    }
}

module porte_balles()
{
    intersection () {
        enveloppe(hull=true);
        union () {
            // ceinture basse
            translate ([0,-d/2-e-jeu/2,0]) 
                cube([2*d+3*e+jeu,d+2*e+jeu, h_cb]);
        }
    }
    // montants
    montants();
    
    if (included) {
        translate ([d/2+e+jeu/2,0,delta_h])
            balle();
        translate ([d/2+e+d+e+jeu/2,0,delta_h])
            balle();
    }
}

module grandes_spheres() {
    translate([d/2+e+jeu/2,0,delta_h])
        sphere(d=d+2*e+jeu);
    translate([d/2+e+d+e+jeu/2,0,delta_h])
        sphere(d=d+2*e+jeu);
}

module petites_spheres() {
    translate([d/2+e+jeu/2,0,delta_h])
        sphere(d=d+jeu);
    translate([d/2+e+d+e+jeu/2,0,delta_h])
        sphere(d=d+jeu);
}

module enveloppe_ext(hull) {
    if (hull) {
        hull () grandes_spheres();
    } else {
        grandes_spheres();
    }
}

module enveloppe_int(hull) {
    if (hull) {
        hull () petites_spheres();
    } else {
        petites_spheres();
    }
}

module enveloppe(hull)
{
    intersection () {
        difference () {
            enveloppe_ext(hull);
            enveloppe_int(hull);            
        }
        translate ([0,-d/2-e-jeu/2,0])
            cube([2*d+3*e+jeu,d+2*e+jeu,d /* suffisamment haut */]);
    }
}
    
if (!included && !included_in_sommet && !included_in_attache) {
    porte_balles();
} 