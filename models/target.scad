// Treating 1 unit as 1mm
units = 25.4;
width=1.5*units;
height=2*units;
arch_thickness=0.17*units;
hole_size = width - 4*arch_thickness;

// arc angle and segment length (when generating circles and arcs, it will break the arc into segments like this)
$fa=5;
$fs=1;

difference() {
  union() {
    cylinder(d=width, h=height - width/2);
    translate([0,0,height - width/2]) sphere(d=width);
  }

  translate([0,0,height - hole_size/2 - arch_thickness]) union() {
    rotate([90,0,0]) cylinder(d=hole_size, h=2*width, center=true);
    rotate([90,0,90]) cylinder(d=hole_size, h=2*width, center=true);
  }
}

