
// selection du cable:
// 1: cable normal lightspeed
CABLE_LIGHTSPEED=1;
// 2: cable coudé lightspeed
CABLE_COUDE_LIGHTSPEED=2;

cable=CABLE_COUDE_LIGHTSPEED; 
//cable=CABLE_LIGHTSPEED; 

include <Support.scad>


epsilon = 0.01; // utilisé pour éviter que les évidements se fassent mal
jeu = 1; // jeu à prévoir 

w = 3; 	    // width of the support, around the iphone+case, on the left and right side
e = 2;      // width of the front and rear planes
h = 120;    // height of the support (hauteur du vert)

// taille de l'iphone + case
// iphone 5S:
iphoneWidth=62;
iphoneDepth=10.2;
iphoneHeight=127;
iphoneBandeauHeight=16; // hauteur (case compris) du bandeau du bas
iphoneBaseHeight=22; // hauteur a rajouter au support pour couvrir le cable

d = 2; // diametre du cable

d_ecrou = 5; // taille de l'écrou 
h_ecrou = 2; // hauteur de l'écrou
d_boulon = 3; // a verifier: diametre du boulon

difference() {
    union () {
        supportPart1(iphoneWidth, iphoneDepth, 
            iphoneHeight, iphoneBandeauHeight, iphoneBaseHeight);
        elements_a_ajouter1();
    }
    elements_a_enlever();
}
elements_en_plus_1();

translate([80,0,0]) rotate([90,0,0]) {
    difference() {
        union () {
            supportPart2(iphoneWidth, iphoneDepth, 
                iphoneHeight, iphoneBandeauHeight, iphoneBaseHeight);
            elements_a_ajouter2();
        }
        elements_a_enlever();
    }
    elements_en_plus_2();
}

translate([-100,0,0]) {
    difference() {
        union() {
            support(iphoneWidth, iphoneDepth, 
                iphoneHeight, iphoneBandeauHeight, iphoneBaseHeight);
            elements_a_ajouter();
        }
        elements_a_enlever();
    }
    elements_en_plus();
}


module elements_a_ajouter() {
    elements_a_ajouter1();
    elements_a_ajouter2();
}
module elements_a_enlever() {
    passages_ecrous();
    connector();
    translate([iphoneWidth+jeu+2*w,0,0]) mirror([1,0,0]) connector();
    ears();
}

module elements_en_plus_1 (){ // toujours présents
    color("red") ears_grid();
}

module elements_en_plus_2 (){ // toujours présents
}

module elements_en_plus (){ // toujours présents
    elements_en_plus_1();
    elements_en_plus_2();
}

module elements_a_ajouter1() {
}

module elements_a_ajouter2() {
}

module passage_ecrou() {
    // ecrou
    translate([0,e+iphoneDepth,0])
        rotate([90,90,0])
            cylinder(h_ecrou+jeu, d=(d_ecrou+jeu)/sqrt(3)*2, $fn=6);
    // passage
    translate([(d_ecrou+jeu)/2,e+iphoneDepth-h_ecrou-jeu,0]) 
        rotate([0,180,0]) cube([d_ecrou+jeu,h_ecrou+jeu, d_ecrou+jeu+1000]);
    // trou pour la vis
    translate([0,e+iphoneDepth-h_ecrou/2,0])
        rotate([90,0,0])
            cylinder(e+iphoneDepth-h_ecrou/2, d=d_boulon+jeu, $fn=100);
    // chanfrein de la vis
    d_tete = 5; // diametre de la tete de vis XXX
    h_tete = 2; // epaisseur de la tete de vis XXX
    translate([0,h_tete+jeu-epsilon,0])
        rotate([90,0,0])
            cylinder(h_tete+jeu, d1=d_boulon+jeu, d2=d_tete+jeu, $fn=100);
}

module passages_ecrous() {
    ecrous(21,3.5);
    ecrous(6,15);
//    ecrous(6,3.5);
//    ecrous(14,15);
}

module ecrous(dist /* distance du bord */, hauteur_ecrous) {
    for (i=[0,1]) {
        translate([i*(w*2+iphoneWidth+jeu-2*dist)+dist,0,hauteur_ecrous])
            passage_ecrou();
    }
}

w_ears=2; // largeur des ouies XXX
h_ears=10; // longueur des ouies XXX
d_ears=2; // distance des ouies du centre de l'iphone XXX
module ears() {
    H = iphoneBaseHeight; // assez grand pour aller jusqu'en bas 
   
    // ouies 
    for (z=[-1,1]) {
        translate([(iphoneWidth+jeu)/2+w-h_ears/2+z*(d_ears+h_ears),
                iphoneDepth/2+e-w_ears/2,
                iphoneBaseHeight+epsilon])
            rotate([30,0,0])
                translate([0,0,-H])
                    cube([h_ears,w_ears,H]);
    }    
}

module ears_grid() {
    //grilles des ouies
    for (z=[-1,1]) {
        s=0.5; // epaisseur de la grille
        for (i=[0:h_ears/s/2])
        {
            translate([(iphoneWidth+jeu)/2+w+z*(h_ears/2+d_ears)+z*i*2*s,
                    iphoneDepth+2*e-s,
                    0])
                cube([s,s,20]);
        }
    }
}
//passe fil
module passefil() {
	translate([iphoneWidth/2+w,iphoneDepth/2,d/2*.75])
		rotate([7,90,0]) 
			cylinder(iphoneWidth/2-d-d/2, r=d/2, $fn=100);
	#translate([iphoneWidth-d/2,iphoneDepth/2-w /*not accurate*/,d/2*.75])
		rotate([90,0,0]) 
			cylinder(iphoneDepth/2, r=d/2, $fn=100);
}

module connector() {
    if (cable==CABLE_LIGHTSPEED) 
        lightning_connector();
    if (cable==CABLE_COUDE_LIGHTSPEED) 
        lightning_connector_coude();
}

// lightning connector
module lightning_connector() {
	union () {
		scale([1,4.6/7.6,1]) translate([0,0,15]) cylinder(12+epsilon, r=7.6, $fn=100);
		translate([0,0,5]) cylinder(10+epsilon, r=3.4, $fn=100);
		translate([0,0,-epsilon]) cylinder(5+2*epsilon, r=d/2, $fn=100);

        // passefil vertical
        translate([-d/2,-iphoneDepth/2-epsilon,-epsilon])
            cube([d,iphoneDepth/2+epsilon,baseHeight+2*epsilon]);
	}
}

module lightning_connector_coude() {
    gap=iphoneBaseHeight-17-jeu; 
    translate([(iphoneWidth+jeu)/2+w,6+jeu,0]) {
        translate([0,0,(17+jeu)/2+gap+epsilon/2]) 
            cube([9+jeu,6+jeu,17+jeu+epsilon], center=true);
        translate([-(9+jeu)/2,-(6+jeu)/2,gap])
            cube([14+jeu,6+jeu,6+jeu]);
        translate([0,0,(6+jeu)/2+gap])
            rotate([0,90,0])
                cylinder((iphoneWidth-3)/2,d=3+jeu,$fn=100);
        
        // coude du fil
        translate([(iphoneWidth-3)/2,(3+jeu)/2,(6+jeu)/2+gap])
            rotate([90,0,0])
                cylinder(iphoneDepth/2+(3+jeu)/2+e,d=3+jeu,$fn=100);
        
    }
    // allongement de trou pour passer le fil dans la plaque verte
    translate([w+iphoneWidth+jeu-(3+jeu)/2,-epsilon/2,(6+jeu)/2+gap-(3+jeu)/2])
         cube([w+(3+jeu)/2+epsilon,e+epsilon,3+jeu]);
}
