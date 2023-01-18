
key_spacing = 19;
column_offset = 2;

function xor(a,b) = (a && !b) || (!a && b);

module LPX() {
  translate([-1.605,-29.001/*-28.96958*/,-9.02 + 2.7644])
    rotate([48.5,0,90]) import("LPX.stl");
}

module printable() {
  rotate([0,0,45]) rotate([-48.5,0,0]) rotate([0,0,-90]) children();
}

module trackpoint_notch(far=false, index=false) {
  dia = 10;

  difference(){
    children();
    translate([key_spacing/2,
    (xor(!index,far) ? -1 : 1) * ( key_spacing/2 + ((far?1:-1) * column_offset) ),
      0])
    cylinder($fn=120, d=dia, h=20, center=true);
  }
}

printable() trackpoint_notch() LPX();
