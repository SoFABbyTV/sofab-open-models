include <dimensions.scad>

include <attache.scad>

included=false; // this value will be overriden in the including file
included_in_puits=true; // this value will override the ones in the include files
  
module puits()
{
    $fn=100;
    
    r=w/2; // rayon de courbure
    difference () {
        union () {
            translate([0, -w/2-e, 0]) cube([l-w/2+e,w+2*e,h]);
            translate([l-w/2+e, 0, 0]) cylinder(h,r=r+e);
        }
        union () {
            translate([e, -w/2, -epsilon]) cube([l-w/2,w,h+2*epsilon]);
            translate([l-w/2+e, 0, -epsilon]) cylinder(h+2*epsilon,r=r);

            if (included_in_puits) {
                attache([d/2+e+jeu/2,w/2+e/2+e-encastrement,-epsilon]);
                attache([d/2+e+jeu/2,-w/2-e/2-e+encastrement,-epsilon]);
            }
                    
        }        
    }
}

if (!included) {
    puits();
}