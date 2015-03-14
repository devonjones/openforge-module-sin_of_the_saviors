include <../smooth/floor_tile/smooth_floor.scad>

module wall_with_diag_doors(x,y,right=false,left=false) {
  difference() {
    union() {
      smooth_floor(x,y,b=9.2,negative=false);
      translate([0,25*y,7.5]) cube([25*x,9.2,41.5]);
      difference() {
        rotate([0,0,-45]) translate([-9.2/2,0,0]) cube([9.2,sqrt((x*25*x*25*2)),49]);
        translate([0,-9.2,-1]) cube([9.2,9.2,51]);
        translate([-9.2,0,-1]) cube([9.2,9.2,51]);
        translate([100,100-9.2,-1]) cube([9.2,9.2,51]);
        rotate([0,0,45]) translate([25,0,0]) square_2x_doorway(0,sqrt(84.64)/2);
        rotate([0,0,45]) translate([sqrt((x*25*x*25*2))-25,0,0]) mirror([1,0,0]) square_2x_doorway(0,sqrt(84.64)/2);
      }
    }
    if(left || right) {
      frame_square_negative(x,y);
    }
    else {
      frame_square_negative(x,y,b=9.2);
    }
    if(left) {
      translate([0,25*y,-1]) rotate([0,0,45]) cube([20,20,55]);
    }
    if(right) {
      translate([25*x,25*y,-1]) rotate([0,0,45]) cube([20,20,55]);
    }
  }
}

wall_with_diag_doors(4,4,right=false,left=false);
