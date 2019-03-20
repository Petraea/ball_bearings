/*Programmatically produce printable ball bearings with support.
You'll need to use a pair of pliers to tug these off once printed.

Definitely don't print this with support!
There is exactly one layer of space between the support and the bearings.
*/
bearing_size=6;
number=[6,5];
$fn=25;
/*Slicer specific settings. These are typical - adjust as needed.
The wall count is simply to make sure the printed base isn't
too thick or too thin.
*/
slice_height=0.1;
wall_count=3;

support=[bearing_size*1.1,
         bearing_size*1.1,
         bearing_size*sqrt(2)/8+slice_height*(wall_count*2-1)];
//sqrt(2)/8 gives support for everything under 45 degrees

for (x=[1:number[0]]) {
  for (y=[1:number[1]]) {
    translate([(x-1)*support[0],(y-1)*support[1],0]) {
      difference() {
        translate([0,0,support[2]/2]) cube(support,center=true);
        translate([0,0,bearing_size/2+slice_height*(wall_count*2-1)]) sphere(r=bearing_size/2+slice_height,center=true);
      }
      translate([0,0,bearing_size/2+slice_height*(wall_count*2-1)]) sphere(r=bearing_size/2,center=true);
    }
  }
}