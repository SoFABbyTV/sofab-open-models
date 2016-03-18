use<ruban.scad>;
spacing = 12.8;

module build_pied(){
    difference(){
        poly_path8913(34);

        //Pas de vis côté FC
        /*rotate([-90,0,0]) translate([-130,-10.46-17,40]) cylinder(r=1.425,h=8);
        rotate([-90,0,0]) translate([-130,10.46-17,40]) cylinder(r=1.425,h=8);*/
        
        //Fourche
        rectangle_hole();
        

        
        //Pas de vis côté ESC
        /*rotate([-90,90,0])
        rotate([-13,0,0])
        translate([-16.1-7,-44,38])
        cylinder(r=1.425,h=15, center=true);*/
        
        //translate([0,2.5,-11.87])
        //translate([2.5,0,-spacing])
        //esc_hole();
        
        //translate([spacing,0,2.5])
        //esc_hole();
        
        
       /* translate([spacing,0,2.5])
        translate([2.5,0,-spacing])
        rotate([-90,90,0])
        rotate([-13,0,0])
        translate([-14.1-7,-44,38])
        cylinder(r=1.425,h=15, center=true);*/
   
    //translate([-17-7,-44,38])
   
    
    
    
    }
}

//rotate([-90,0,0]) translate([40,-017,40]) cylinder(r=1.425,h=8);

module rectangle_hole(){
    rotate([90,90,0])
    translate([-17,43.7,-47])
    rotate([-13,0,0])
    linear_extrude(height = 10, center = true)
    square(size=[6.8, 24.11], center =true);
}

//rectangle_hole();

module esc_hole(){
    rotate([-90,90,0])
    rotate([-13,0,0])
    translate([-15.1-7,-44,38])
    cylinder(r=1.425,h=15, center=true);
}

build_pied();
 //translate([0,2.5,-11.87])
/*
rotate([-90,0,0])
translate([-130,10.46-17,40])
cylinder(r=1.425,h=8);*/



//Fixation côté courbe 9.1 
//7.21 fin milieu
//polygon([0,10]);