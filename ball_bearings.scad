bearing_size=6;
number=[6,5];
slice_height=0.1;
$fn=25;

support=[bearing_size*1.2,
         bearing_size*1.2,
         bearing_size*0.2+slice_height*5];
for (x=[1:number[0]]) {
  for (y=[1:number[1]]) {
    translate([(x-1)*support[0],(y-1)*support[1],0]) {
      difference() {
        translate([0,0,support[2]/2]) cube(support,center=true);
        translate([0,0,bearing_size/2+slice_height*5]) sphere(r=bearing_size/2+slice_height,center=true);
      }
      translate([0,0,bearing_size/2+slice_height*5]) sphere(r=bearing_size/2,center=true);
    }
  }
}