h=12; //Hauteur de l'entretoise
d=3; //Diamètre vis

difference() {
    cylinder(r1=d+1,r2=d,h,$fn=8);
   cylinder(r=d/2.1,h,$fn=30);
    translate([0,0,h-2])cylinder(r1=d/2.1,r2=d/1.6,h=2,$fn=30);
}
    cylinder(r1=d+3,r2=d,h=1,$fn=8);

