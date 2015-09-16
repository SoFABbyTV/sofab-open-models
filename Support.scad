
epsilon = 0.1; // utilisé pour éviter que les évidements se fassent mal
jeu = 1; // jeu à prévoir 

w = 3; 	    // width of the support, around the iphone+case, on the left and right side
e = 2;      // width of the front and rear planes
h = 150;    // height of the support

// chanfrain permettant à l'iphone de bien glisser
cfl = 1; // largeur
cfh = 3; // hauteur

module support(iphoneWidth, iphoneDepth, iphoneHeight, iphoneBandeauHeight, iphoneBaseHeight) {
    supportPart1(iphoneWidth, iphoneDepth, iphoneHeight, iphoneBandeauHeight, iphoneBaseHeight);
    supportPart2(iphoneWidth, iphoneDepth, iphoneHeight, iphoneBandeauHeight, iphoneBaseHeight);
} 


module supportPart1(iphoneWidth, iphoneDepth, iphoneHeight, iphoneBandeauHeight, iphoneBaseHeight) {
    // iphoneWidth
    // iphoneDepth
    // iphoneHeight
    // Taille de l'iphone + case
    // iphoneBandeauHeight: hauteur (case compris) du bandeau du bas
    // iphoneBaseHeight: hauteur a rajouter au support pour couvrir le cable
    
    buttonWidth = 12; // largeur à prevoir autour du bouton de l'iPhone
                      // a verifier

    module bord_droit(){
        hull(){ // border right
            translate([0, e, 0]) 
                cube([w-cfl, iphoneDepth+e, iphoneBaseHeight+iphoneBandeauHeight]); 
            translate([w-cfl, e, 0]) 
                cube([cfl, iphoneDepth, iphoneBaseHeight+iphoneBandeauHeight-cfh]); 
        }
    }
    
    module bord_gauche(){
        hull(){ // border left
            translate([iphoneWidth+jeu+w+cfl, e, 0]) 
                cube([w-cfl, iphoneDepth+e, iphoneBaseHeight+iphoneBandeauHeight]); 
            translate([iphoneWidth+jeu+w, e, 0]) 
                cube([cfl, iphoneDepth, iphoneBaseHeight+iphoneBandeauHeight-cfh]); 
        }
    }
    
    module fond(){
        color("yellow") difference() {
            translate([w-cfl,e+iphoneDepth/2,0])
                cube([iphoneWidth+jeu+2*cfl,iphoneDepth/2+e, iphoneBaseHeight]);
            
            translate([0,0,-epsilon]) bord_droit();
            bord_droit();
            translate([0,0,-epsilon]) bord_gauche();
            bord_gauche();            
        }
    }

    color("blue") 
        difference() {
            intersection() {
                translate([w-cfl,e+iphoneDepth,0]) 
                    cube([iphoneWidth+jeu+2*cfl,e,iphoneBaseHeight+iphoneBandeauHeight]);
                union () {
                    translate([0,e+iphoneDepth,iphoneBaseHeight]) {
                        hull() {
                            rotate([-90,0,0]) {
                                translate([0,0,cfl])
                                    scale([(iphoneWidth+jeu)/2+w-buttonWidth/2,iphoneBandeauHeight,1])
                                        cylinder(e-cfl,r=1,$fn=100);
                                translate([0,cfh,0])
                                    scale([(iphoneWidth+jeu)/2+w-buttonWidth/2,iphoneBandeauHeight,1])
                                        cylinder(cfl,r=1,$fn=100);
                                }
                        } 
                    }
                    translate([iphoneWidth+jeu+2*w,e+iphoneDepth,iphoneBaseHeight]) {
                        hull() {
                            rotate([-90,0,0]) {
                                translate([0,0,cfl])
                                    scale([(iphoneWidth+jeu)/2+w-buttonWidth/2,iphoneBandeauHeight,1])
                                        cylinder(e-cfl,r=1,$fn=100);
                                translate([0,cfh,0])
                                    scale([(iphoneWidth+jeu)/2+w-buttonWidth/2,iphoneBandeauHeight,1])
                                        cylinder(cfl,r=1,$fn=100);
                                }
                        } 
                    }
                }
            }
            translate([0,0,-epsilon]) bord_droit();
            bord_droit();
            translate([0,0,-epsilon]) bord_gauche();
            bord_gauche();
            translate([0,epsilon,0]) fond();
            translate([0,0,-epsilon]) fond();
        }
    color("red")
        fond();
    color("yellow") {
        bord_droit();
        bord_gauche();
    }
}


module supportPart2(iphoneWidth, iphoneDepth, iphoneHeight, iphoneBandeauHeight, iphoneBaseHeight) {
            color("green") 
                cube([iphoneWidth + jeu + 2*w, e, h]); // plaque arrière
            color("red")
                translate([w + jeu/2,e,0])
                    cube([iphoneWidth,iphoneDepth/2,iphoneBaseHeight]); // fond
}



debug=1;
debug=0;

if (debug) {
    supportPart1(80, 10, 30, 15, 5);
    supportPart2(80, 10, 30, 15, 5);

    translate([-130,0,0]) {
        supportPart1(80, 10, 30, 15, 5);
        rotate([90,0,0])
            supportPart2(80, 10, 30, 15, 5);
    }
}