// Treating 1 unit as 1mm
units = 25.4;
width=2*units;
height=2*units;
arch_thickness=0.17*units;
hole_size = 1.25*units;  //width - 4*arch_thickness;
hole_stretch_factor=0.8;

// arc angle and segment length (when generating circles and arcs, it will break the arc into segments like this)
$fa=5;
$fs=1;

difference() {
  difference() {
    union() {
      cylinder(d=width, h=height - width/2);  // for basic cylinder, height should just be height
      translate([0,0,height - width/2]) sphere(d=width);  // remove this for basic cylinder
    }

    // for rectangular prism:
    // union() {
    //   cube([width, width, height]);
    //   cube([width+2*lip_width, width+2*lip_width, lip_height]);
    // }

    translate([0,0,height - (hole_stretch_factor*height)/2 - arch_thickness]) union() {
      rotate([90,0,0]) scale([1,hole_stretch_factor*height/hole_size,1]) cylinder(d=hole_size, h=2*width, center=true);
      rotate([90,0,90]) scale([1,hole_stretch_factor*height/hole_size,1]) cylinder(d=hole_size, h=2*width, center=true);
    }
  }

  // The sphere to dome the inside ceiling
  translate([0,0,height - hole_size/2 - 0.75*arch_thickness]) sphere(d=hole_size);
}

