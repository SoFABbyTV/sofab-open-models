
include <dimensions.scad>

include <porte-balles.scad>

included=false; // this value will be overriden in the including file
included_in_sommet=true; // this value will override the ones in the include files



module porte_balles_sommet()
{
    intersection () {
        difference() {
            union() {
                enveloppe_ext(hull=false);
                translate([d/2+jeu,-l_m/2,0])
                    cube([d+e,l_m,d]);
            }
            enveloppe_int(hull=false);
            cubes_montants();
        }
        translate ([0,-d/2-e-jeu/2,h_m]) 
            cube([2*d+3*e+jeu,d+2*e+jeu, e]);
    }
}

    
if (!included) {
    rotate([0,180,0])
        porte_balles_sommet();
} 