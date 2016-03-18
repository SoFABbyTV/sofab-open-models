$fn=120;
d=105.5; //diamètre total

for ( i = [0 : 130] )
{
    rotate( i * 360 / 130, [1, 0, 0])
    translate([0,0, 82]) rotate([45,0,0]) 
    cube([60,0.7,30]);
}

difference() {
  
    union() {
        rotate([0,90,0]) cylinder(r=d,h=1,center=true);
    

        difference() {
            rotate([0,90,0]) translate([0,0,60])
            cylinder(r=d,h=1,center=true);
            rotate([0,90,0]) translate([0,0,60])
            cylinder(r=d-23.3,h=2,center=true);
        }
        difference() {
            translate([-56,0,0]) sphere(100);
            rotate([0,90,0]) translate([-1,0,-100.1]) cylinder(r=150,h=200,center=true);
        }
    }
rotate([0,90,0]) translate([0,-0,5]) cylinder(r=1.5,h=20,center=true); //trou axe
}

