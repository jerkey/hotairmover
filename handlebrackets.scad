translate([40,0,0]) rotate([0,0,-90]) difference() {
union() {
color("purple") translate([0,0,5]) cube(size = [33,33,10], center = true);
}
color("grey") translate([0,0,-.5]) rotate([0,0,22.5])cylinder(h = 11, r = 29/2, $fn = 8);
color("red") translate([-11,29/4,5]) rotate([90,0,0]) cylinder(h = 29/2, r = 3.5/2, $fn = 100, center = true);
color("red") translate([11,29/4,5]) rotate([90,0,0]) cylinder(h = 29/2, r = 3.5/2, $fn = 100, center = true);
color("red") translate([0,-11,5]) rotate([0,90,0]) cylinder(h = 40, r = 3.5/2, $fn = 100, center = true);
}

hingeOffset = 30;
armHeight = hingeOffset + 7;

difference() {
color("purple") translate([0,0,5]) cube(size = [armHeight,33+8,10], center = true);
color("purple") translate([(armHeight/2-3)/2+3.1,0,5]) cube(size = [armHeight/2-3,33,11], center = true);
color("purple") translate([-((armHeight/2-3)/2+3.1),0,5]) cube(size = [armHeight/2-3,33,11], center = true);
color("red") translate([-hingeOffset/2,0,5]) rotate([90,0,0]) cylinder(h = 50, r = 3.5/2, $fn = 100, center = true);
}