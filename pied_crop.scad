use<pied.scad>;

intersection(){
    build_pied();    
    
    //Crop
    rotate([90,90,0])
    translate([-17,43.7,-47])
    rotate([-13,0,0])
    linear_extrude(height = 10, center = true)
    square(size=[40, 24.11], center =true);
}
     



module rectangle_hole(){
    rotate([90,90,0])
    translate([-17,43.7,-47])
    rotate([-13,0,0])
    linear_extrude(height = 10, center = true)
    square(size=[6.8, 24.11], center =true);
}

module esc_hole(){
    rotate([-90,90,0])
    rotate([-13,0,0])
    translate([-15.1-7,-44,38])
    cylinder(r=1.425,h=15, center=true);
}