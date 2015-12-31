thickness 	= 5;
width 		= 140;
height 		= 140;
depth 		= 140;

o = 0.125; 	// offset for lasercutter beam width
f = 1; 		// fix for overlapping edges issue
c = 30; 	//cornerResolution ($fn)
s = 1; 		//seperator dis.

scale([-1,1,1]) rotate([0,0,-90]) 
export();
//assembly3D();

module export()
{													offset(o) bottom();
	translate([width+o+s,0,0]) 						offset(o) top();
	translate([0,depth+o+s,0]) 						offset(o) front();
	translate([width+o+s,depth+o+s,0]) 				offset(o) back();
	translate([0,depth+o+s+height+o+s,0]) 			offset(o) left();
	translate([depth+o+s,depth+o+s+height+o+s,0]) 	offset(o) right();
}
module assembly3D()
{
	alpha = 0.7;
	translate([0,0,thickness/2]) 
		wood(alpha,"DarkMagenta") 		bottom();
	translate([0,0,height-thickness/2]) 
		wood(alpha,"SteelBlue") 		top();
	translate([0,thickness/2,0]) 		rotate([90,0,0])
		wood(alpha,"DarkOliveGreen") 	front();
	translate([0,depth-thickness/2,0]) 	rotate([90,0,0])
		wood(alpha,"DarkGoldenrod") 	back();
	translate([thickness/2,,0]) 		rotate([90,0,90]) 
		wood(alpha,"DarkRed") 			left();
	translate([width-thickness/2,0,0]) 	rotate([90,0,90]) 
		wood(alpha,"DarkGray") 			right();
}
module top() 	{ 	boxJointPanel(width,depth,thickness,true,true,true,true); 		}
module bottom() { 	top(); 															}
module front() 	{ 	boxJointPanel(width,height,thickness,false,false,false,false); 	}
module back() 	{ 	front(); 														}
module left() 	{ 	boxJointPanel(depth,height,thickness,false,true,false,true); 	}
module right() 	{ 	left(); 														}

module boxJoint(length,thickness,male = true,minToothWidth=10,beginEndSpace=0)
{
	length2 	= length-beginEndSpace*2;
	numTooth 	= round(length/minToothWidth);
	numTooth2 	= (numTooth%2 == 0)? numTooth-1 : numTooth;
	toothWidth 	= length2/numTooth2;
	toothHeight = thickness;
	on 			= (male)? 0 : 1;
	translate([beginEndSpace,0,0])
	{
		for ( i = [0 : numTooth2-1] )
		{
			if(i%2==on) translate([i*toothWidth,-f,0])
			{
				if(i==0) translate([-beginEndSpace-f,0,0]) 
					square([toothWidth+beginEndSpace+f,toothHeight+f]);
				else if(i==numTooth2-1) translate([0,0,0]) 
					square([toothWidth+beginEndSpace+f,toothHeight+f]);
				else 
					square([toothWidth,toothHeight+f]);
			}
		}
	}
}
module boxJointPanel(width,height,thickness,
						maleTop = true, maleRight = true,
						maleBottom = true, maleLeft = true,
						minToothWidth=10)
{
	difference()
	{
		square([width,height]);
		translate([width,height,0]) rotate([0,0,180])
			boxJoint(width,thickness,maleTop,minToothWidth,thickness); //top		
			boxJoint(width,thickness,maleBottom,minToothWidth,thickness); //bottom		
		translate([width,0,0]) rotate([0,0,90])  
			boxJoint(height,thickness,maleRight,minToothWidth,thickness); //right
		translate([0,height,0]) rotate([0,0,-90]) 
			boxJoint(height,thickness,maleLeft,minToothWidth,thickness); //left
	}
}
module wood(alpha=1,color="BurlyWood")
{
	h = thickness;
	color(color,alpha) linear_extrude(height=h,convexity=c,center=true) 
		for (i = [0 : $children-1]) child(i);
}
module offset(value=0) //simple offset function, only works properly on objects with straigt corners
{
	minkowski(){
		union()	for (i = [0 : $children-1]) child(i);
		square([value,value],center=true);
	}
}