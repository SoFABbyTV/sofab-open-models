
include <dimensions.scad>

include <porte-balles.scad>
include <porte-balles-sommet.scad>
include <puits.scad>
include <attache.scad>

included=true; // this value will override the ones in the include files

    

module flotteur()
{
    translate([0,w/2+2*e+e+d/2-2*encastrement,ha+h-h_cb]) {
        porte_balles();
        porte_balles_sommet();
    }
    translate([0,-w/2-2*e-e-d/2+2*encastrement,ha+h-h_cb]) {
        porte_balles();
        porte_balles_sommet();
    }
    attache([d/2+e+jeu/2,w/2+e/2+e-encastrement,0]);
    attache([d/2+e+jeu/2,-w/2-e/2-e+encastrement,0]);
    puits();
}

flotteur();

