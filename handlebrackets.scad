bracketOuter = 33;
bracketScrewOffset = 11; // position of screw axis relative to tool centerline
/*
// translate([40,0,0]) rotate([0,0,-90]) difference() {
translate([4.3,0,0]) rotate ([0,45,0]) translate([bracketScrewOffset-2,0,0]) rotate([0,0,-90]) difference() { // check hinge fit
  union() {
    color("purple") translate([0,0,5]) cube(size = [bracketOuter,bracketOuter,10], center = true);
  }
  color("grey") translate([0,0,-.5]) rotate([0,0,22.5])cylinder(h = 11, r = 29/2, $fn = 8); // octagon
  color("green") translate([-11,29/4,5]) rotate([90,0,0]) cylinder(h = 22, r = 3.5/2, $fn = 100, center = true);
  color("red") translate([11,29/4,5]) rotate([90,0,0]) cylinder(h = 22, r = 3.5/2, $fn = 100, center = true);
  color("blue") translate([0,-1 * bracketScrewOffset,5]) rotate([0,90,0]) cylinder(h = 40, r = 3.5/2, $fn = 100, center = true);
  color("white") translate([5,21,-.5]) cylinder(h = 11, r = 5, $fn = 100); // cutout for air hose
}
*/
// screw axis is 11mm lower than centerline of soldering tool handle
// hingeOffset = 29 - 11 - 5; // distange between screw axes on hinge piece
// hingeOffset = 13 / 0.707; // assuming a 45-degree angle of a 13mm vertical offset
hingeOffset = 23 / 0.707; // assuming a 45-degree angle of a 23mm vertical offset
// screw axis on 10mm thick base will be 5mm above table surface
armHeight = hingeOffset + 3.5*3;
armWidth = bracketOuter + 8; // bracket outer width prints as bracketOuter + 0.5;
armMiddle = 4;        // arm prints to 0.5mm SMALLER than it should be so lets add 1

difference() { // front hinge
  color("purple") hull() {
    translate([-armHeight/2+5,0,5]) rotate([90,0,0]) cylinder(h=armWidth,r=5,$fn=50, center = true);
    translate([armHeight/2-5,0,5]) rotate([90,0,0]) cylinder(h=armWidth,r=5,$fn=50, center = true);
  }
  color("orange") translate([6.5,0,5]) cube(size = [35,bracketOuter+1,11], center = true); // +1 to make it fit
  // color("orange") translate([-(armHeight/4+armMiddle/2),0,5]) cube(size = [armHeight/2,bracketOuter,11], center = true);
  color("red") translate([-hingeOffset/2,0,5]) rotate([90,0,0]) cylinder(h = armWidth+2, r = 3.5/2, $fn = 100, center = true);
  color("yellow") translate([+hingeOffset/2,0,5]) rotate([90,0,0]) cylinder(h = armWidth+2, r = 3.9/2, $fn = 100, center = true);
}

tailOuter = 20;
tailDia = 12; // diameter of tail of soldering tool
tailScrewOffset = 5; // position of screw axis relative to tool centerline
/*
translate([40,0,0]) rotate([0,0,-22.5]) difference() { // tail bracket
  union() {
    color("purple") translate([0,0,5]) cube(size = [tailOuter,tailOuter,10], center = true);
  }
  color("grey") translate([0,0,-.5]) rotate([0,0,22.5])cylinder(h = 11, r = tailDia/2, $fn = 100);
  color("red") translate([0,-1 * tailScrewOffset,5]) rotate([0,90,0]) cylinder(h = 40, r = 3.5/2, $fn = 100, center = true);
}
*/
// tail screw axis is 5mm lower than centerline of soldering tool handle
// tailHingeOffset = hingeOffset + bracketScrewOffset - tailScrewOffset; // 19 distange between screw axes on hinge piece
tailHingeOffset = 30.676; // ((23+11-5)^2 + 10^2)^0.5
 // screw axis on 10mm thick base will be 5mm above table surface
tailArmHeight = tailHingeOffset + 3.5*3;
tailArmWidth = tailOuter + 8;

translate([0,36,0]) difference() {
  color("purple") hull() {
    translate([-tailArmHeight/2+5,0,5]) rotate([90,0,0]) cylinder(h=tailArmWidth,r=5,$fn=50, center = true);
    translate([tailArmHeight/2-5,0,5]) rotate([90,0,0]) cylinder(h=tailArmWidth,r=5,$fn=50, center = true);
  }
  color("purple") translate([(tailArmHeight/2-3)/2+3.1,0,5]) cube(size = [tailArmHeight/2-3,tailOuter+1,11], center = true);
  color("purple") translate([-((tailArmHeight/2-3)/2+3.1),0,5]) cube(size = [tailArmHeight/2-3,tailOuter+1,11], center = true);
  color("yellow") translate([-tailHingeOffset/2,0,5]) rotate([90,0,0]) cylinder(h = tailArmWidth+2, r = 3.9/2, $fn = 100, center = true);
  color("yellow") translate([+tailHingeOffset/2,0,5]) rotate([90,0,0]) cylinder(h = tailArmWidth+2, r = 3.9/2, $fn = 100, center = true);
  color("black") translate([+tailHingeOffset/2,0,10]) rotate([0,95,0]) cylinder(h = 90, r = 12.5/2, $fn = 100, center = true);
}

baseThickness = 3;
baseAxesOffset = 108 - 13; // hingeOffset = 13 / 0.707; // assuming a 45-degree angle of a 13mm vertical offset
/*
translate([baseAxesOffset/2-armHeight/2+5,0,0]) difference() { // front hinge part of base
  color("purple") hull() {
    translate([-armHeight/2+5,0,5]) rotate([90,0,0]) cylinder(h=armWidth+8,r=5,$fn=50, center = true);
    translate([armHeight/2-5,0,5]) rotate([90,0,0]) cylinder(h=armWidth+8,r=5,$fn=50, center = true);
  }
  color("purple") translate([11,0,5]) cube(size = [30,armWidth+1,11], center = true); // +1 to make it fit
  // color("red") translate([-hingeOffset/2,0,5]) rotate([90,0,0]) cylinder(h = armWidth+2, r = 3.5/2, $fn = 100, center = true);
  color("red") translate([+hingeOffset/2,0,5]) rotate([90,0,0]) cylinder(h = armWidth+12, r = 3.5/2, $fn = 100, center = true);
}
// translate([0,0,7]) cube([baseAxesOffset,tailOuter,baseThickness], center = true); // checking that screw axes are correct offset
difference() { // tail hinge and long part of base
  color("purple") union() {
    translate([-baseAxesOffset/2,0,5]) rotate([90,0,0]) cylinder(h=tailOuter,r=5,$fn=50, center = true);
    // translate([armHeight/2-5,0,5]) rotate([90,0,0]) cylinder(h=tailOuter,r=5,$fn=50, center = true);
    translate([-armHeight/2+5,0,baseThickness/2]) cube([baseAxesOffset-armHeight+10,tailOuter,baseThickness], center = true); // flat base
  }
  translate([20,0,baseThickness/2+1])color("yellow") cube([6,17,baseThickness], center = true); // magnets
  translate([-38,0,baseThickness/2+1])color("yellow") cube([6,17,baseThickness], center = true); // magnets
//  color("purple") translate([11,0,5]) cube(size = [30,bracketOuter+1,11], center = true); // +1 to make it fit
  // color("orange") translate([-(armHeight/4+armMiddle/2),0,5]) cube(size = [armHeight/2,bracketOuter,11], center = true);
  color("red") translate([-baseAxesOffset/2,0,5]) rotate([90,0,0]) cylinder(h = tailOuter+2, r = 3.5/2, $fn = 100, center = true);
  // color("red") translate([+baseAxesOffset/2,0,5]) rotate([90,0,0]) cylinder(h = tailOuter+2, r = 3.5/2, $fn = 100, center = true);
}
*/
