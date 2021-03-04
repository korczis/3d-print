echo(version=version());

// Bed width
BED_WIDTH = 50;

// Bed height
BED_HEIGHT = 5;

// Bearing inner diameter
BEARING_DIAMETER_INNER = 8.15;

// Bearing outter diameter
BEARING_DIAMETER_OUTTER = 21.5;

// Bearing height
BERING_HEIGHT = 6.5;

// Top plate diameter
PLATE_DIAMETER = BED_WIDTH; // BED_WIDTH / 2;

// Top plate height
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
    cylinder(pylon_height, BEARING_DIAMETER_INNER / 2 * 1.1, BEARING_DIAMETER_OUTTER / 2, center = false);
   
    // Plate
    // translate([100, 100, 1000]);
    // cylinder(10, 10, center = false);
    // ring(BERING_HEIGHT, BEARING_DIAMETER_OUTTER * 2, BEARING_DIAMETER_OUTTER, 100);
}

module photogametry_mount() {
    difference() {
        cylinder(h = BERING_HEIGHT * 3, r = BEARING_DIAMETER_OUTTER / 2 * 1.25);
        cylinder(h = BERING_HEIGHT * 2.5, r1 = BEARING_DIAMETER_OUTTER * 1.1 / 2, r2 = BEARING_DIAMETER_OUTTER * 0.95 / 2);
    }
    
    translate([0, 0, BERING_HEIGHT * 2.8]) {
    cylinder(h = PLATE_HEIGHT, r = PLATE_DIAMETER, center = false);
    }
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
    
    // Mount
    photogametry_mount();
    
    // Top plate
    // photogametry_plate();
}

// Render main object
main();