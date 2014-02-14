bracketOuter = 33;
bracketScrewOffset = 11; // position of screw axis relative to tool centerline

translate([40,0,0]) rotate([0,0,-90]) difference() {
  union() {
    color("purple") translate([0,0,5]) cube(size = [bracketOuter,bracketOuter,10], center = true);
  }
  color("grey") translate([0,0,-.5]) rotate([0,0,22.5])cylinder(h = 11, r = 29/2, $fn = 8);
  color("green") translate([-11,29/4,5]) rotate([90,0,0]) cylinder(h = 22, r = 3.5/2, $fn = 100, center = true);
  color("red") translate([11,29/4,5]) rotate([90,0,0]) cylinder(h = 22, r = 3.5/2, $fn = 100, center = true);
  color("blue") translate([0,-1 * bracketScrewOffset,5]) rotate([0,90,0]) cylinder(h = 40, r = 3.5/2, $fn = 100, center = true);
  color("white") translate([5,21,-.5]) cylinder(h = 11, r = 5, $fn = 100); // cutout for air hose
}

// screw axis is 11mm lower than centerline of soldering tool handle
hingeOffset = 30; // distange between screw axes on hinge piece
// screw axis on 10mm thick base will be 5mm above table surface
armHeight = hingeOffset + 3.5*3;
armWidth = bracketOuter + 8;

difference() {
  color("purple") hull() {
    translate([-armHeight/2+5,0,5]) rotate([90,0,0]) cylinder(h=armWidth,r=5,$fn=50, center = true);
    translate([armHeight/2-5,0,5]) rotate([90,0,0]) cylinder(h=armWidth,r=5,$fn=50, center = true);
  }
  color("purple") translate([(armHeight/2-3)/2+3.1,0,5]) cube(size = [armHeight/2-3,bracketOuter,11], center = true);
  color("purple") translate([-((armHeight/2-3)/2+3.1),0,5]) cube(size = [armHeight/2-3,bracketOuter,11], center = true);
  color("red") translate([-hingeOffset/2,0,5]) rotate([90,0,0]) cylinder(h = armWidth+2, r = 3.5/2, $fn = 100, center = true);
  color("red") translate([+hingeOffset/2,0,5]) rotate([90,0,0]) cylinder(h = armWidth+2, r = 3.5/2, $fn = 100, center = true);
}
