include <dimensions.scad>

include <porte-balles.scad>

included=false; // this value will be overriden in the including file
included_in_puits=false; // this value will be overriden in the including file

included_in_attache=true; // this value will override the ones in the include files

  
module attache(pos)
{
    la = min(l-w/2+e, d + e /*largeur porte_balle*/) - 10; // longueur attache
    translate(pos) 
        translate([0,-e/2,0]) 
            cube([la, e, ha+h]);    
}



if (!included && !included_in_puits) {
    rotate([90,0,0]) 
        difference () {
            attache();
            translate ([-(d/2+e+jeu/2),d/2+e/2+e-encastrement,ha+h-h_cb])
             porte_balles();
        }
}