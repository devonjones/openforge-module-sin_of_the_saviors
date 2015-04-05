include <../../../smooth/floor_tile/smooth_floor.scad>

module smooth_edge_wall_with_buffers(x,y,lb=0,rb=0) {
  difference() {
    union() {
      translate([9.2*lb,0,0]) smooth_floor(x,y,b=9.2,negative=false);
      translate([0,25*y,7.5]) cube([25*x+9.2*lb+9.2*rb,9.2,41.5]);
      if(lb == 1) {
        cube([9.21,25*y+9.2,7.5]);
        for ( i = [0 : y-1] ) {
          translate([.325,25*i+.325,0]) cube([9.2-.325*2,24.35,9.5]);
        }
      }
      if(rb == 1) {
        #translate([9.2*lb+x*25-0.1,0,0]) cube([9.21,25*y+9.2,7.5]);
        for ( i = [0 : y-1] ) {
          translate([9.2*lb+x*25+.325,25*i+.325,0]) cube([9.2-.325*2,24.35,9.5]);
        }
      }
    }
    translate([9.2*lb,0,0]) frame_square_negative(x,y,b=9.2);
  }
}

//smooth_edge_wall_with_buffers(2,2,lb=1,rb=0);
