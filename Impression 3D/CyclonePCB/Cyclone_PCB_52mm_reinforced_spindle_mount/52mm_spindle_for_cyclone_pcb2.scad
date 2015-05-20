union() {
difference() {
difference() {
union() {
difference() {
translate([-35,-69,0]){
	import("E:/3D_models/Cyclone-PCB-Factory-2.0/Output_files/Cycl_Zcarriage_only.stl");
}
mirror() translate([-49,-2,0]) cylinder(d=52.6, h=44.95/2+2, $fn=100);
translate([-29,37.45,2]) cylinder(d=15.5, h=10, $fn=100);
mirror() color("black") translate([-69,37.45,2]) cylinder(d=15.5, h=10, $fn=100);
mirror() color("red") translate([-29,37.45,2]) cylinder(d=15.5, h=10, $fn=100);
mirror() color("black") translate([-69,37.45,2]) cylinder(d=15.5, h=10, $fn=100);
}

mirror() {
	difference(){
	translate([-35,-69,0]){
	import("E:/3D_models/Cyclone-PCB-Factory-2.0/Output_files/Cycl_Zcarriage_only.stl");
	}
	mirror() translate([-49,-2,0]) cylinder(d=52.6, h=44.95/2+2, $fn=100);
}
}


difference() {
translate([-49,-2,0]) cylinder(d=70, h=44.95/2+2, $fn=100);
translate([-49,-2,0]) cylinder(d=52.6, h=44.95/2+2, $fn=100);
}

difference(){
mirror() translate([-49,-2,0]) cylinder(d=70, h=44.95/2+2, $fn=100);
mirror() translate([-49,-2,0]) cylinder(d=52.6, h=44.95/2+2, $fn=100);
}

difference(){ 
translate([-29,37.45,2]) cylinder(d=22, h=44.95/2, $fn=100);       
translate([-29,37.45,2]) cylinder(d=15.6, h=44.95/2+0.01, $fn=100);
}

difference(){ 
color("green") translate([-69,37.45,2]) cylinder(d=22, h=44.95/2, $fn=100);
color("green") translate([-69,37.45,2]) cylinder(d=15.6, h=44.95/2+0.01, $fn=100);
}

difference() {
mirror() color("red") translate([-29,37.45,2]) cylinder(d=22, h=44.95/2, $fn=100);
mirror() color("red") translate([-29,37.45,2]) cylinder(d=15.6, h=44.95/2+0.01, $fn=100);
}

difference() {
mirror() color("black") translate([-69,37.45,2]) cylinder(d=22, h=44.95/2, $fn=100);
mirror() color("black") translate([-69,37.45,2]) cylinder(d=15.6, h=44.95/2+0.01, $fn=100);
}


}
translate([-30,-3,-5]) cube([60,6,70]);
}
translate([-80,50,-2]) cube([60,60,30]);
}

/*
difference(){
color("red") translate([-49.1,50.3,0]) cylinder(d=28, h=10, $fn=100);
translate([-49.1,50.3,0]) cylinder(d=22, h=10+0.01, $fn=100);
}
*/
}

