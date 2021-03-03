echo(version=version());

// Bed settings
BED_WIDTH = 50;
BED_HEIGHT = 5;

// Bearing settings
BEARING_DIAMETER_INNER = 8.15;
BEARING_DIAMETER_OUTTER = 21.5;
BERING_HEIGHT = 6.5;

// Plate settings
PLATE_DIAMETER = BED_WIDTH / 2;
PLATE_HEIGHT = BED_HEIGHT; // 10;

// Helper function for ring
module ring(height = 1, outter_diameter = 10, inner_diameter = 5, de = 0.1) {
    difference() {
        cylinder(h = height, r = outter_diameter / 2);
        translate([0, 0, - de]) 
        cylinder(h = height + 2 * de, r = inner_diameter / 2, false);
    }
}
// Stand
module photogametry_stand() { 
    // Bed
    cube(size = [BED_WIDTH, BED_WIDTH, BED_HEIGHT], center = true);
    
    // Pylon
    pylon_height = BERING_HEIGHT * 3 + BED_HEIGHT;
    cylinder(pylon_height, BEARING_DIAMETER_INNER / 2 * 1.1,  BEARING_DIAMETER_OUTTER / 2, center = false);
   
    // Plate
    // translate([100, 100, 1000]);
    // cylinder(10, 10, center = false);
    // ring(BERING_HEIGHT, BEARING_DIAMETER_OUTTER * 2, BEARING_DIAMETER_OUTTER, 100);
}

// Top plate
module photogametry_plate() {
    // difference() {
    // }
    
    // cylinder(h = height, r = BEARING_DIAMETER_OUTTER / 2, 1);
    // ring(BERING_HEIGHT, BEARING_DIAMETER_OUTTER * 2, BEARING_DIAMETER_OUTTER, 100);
    
    // cylinder(2 * BEARING_HEIGHT,  BEARING_DIAMETER_OUTTER / 2, false);
    cylinder(BERING_HEIGHT * 3, BEARING_DIAMETER_OUTTER * 5, BEARING_DIAMETER_OUTTER * 5);
} 

// Main object
module main() {
    // Stand
    // photogametry_stand();
    
    // Top plate
    photogametry_plate();
}

// Render main object
main();