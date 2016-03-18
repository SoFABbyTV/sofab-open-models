$fn=120;
d=57; //diamètre total
h=30;

for ( i = [0 : 100] )
{
    rotate( i * 360 / 100, [1, 0, 0])
    translate([0,0, 41]) rotate([45,0,0]) 
    cube([30,0.7,20]);
}

difference() {
  
    union() {
        rotate([0,90,0]) cylinder(r=d,h=1,center=true);
    

        difference() {
            rotate([0,90,0]) translate([0,0,h])
            cylinder(r=d,h=1,center=true);
            rotate([0,90,0]) translate([0,0,h])
            cylinder(r=d-15.5,h=2,center=true);
        }
        difference() {
            translate([-42,0,0]) sphere(60); //sphere
  rotate([0,90,0])  translate([-100,0,-100.1]) cylinder(r=200,h=200,center=true);        }
    }
rotate([0,90,0]) translate([0,0,-5]) cylinder(r=1.5,h=40,center=true); //trou axe
}

