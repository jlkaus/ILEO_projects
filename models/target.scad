// Treating 1 unit as 1mm
width=1.5*25.4;
height=2.5*25.4;
arch_thickness=0.25*25.4;
hole_size = width - 2*arch_thickness;

// arc angle and segment length (when generating circles and arcs, it will break the arc into segments like this)
$fa=5;
$fs=1;

difference() {
  union() {
    cylinder(d=width, height);
    translate([0,0,height - width/2]) sphere(d=width);
  }

  union() {
    translate([0,0,height + width/2 - hole_size/2 - arch_thickness]) rotate([90,0,0]) cylinder(d=hole_size, 2*width);
    translate([0,0,height + width/2 - hole_size/2 - arch_thickness]) rotate([90,0,90]) cylinder(d=hole_size, 2*width);
  }
}
