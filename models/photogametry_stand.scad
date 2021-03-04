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
BEARING_HEIGHT = 6.5;

// Top plate diameter
PLATE_DIAMETER = BED_WIDTH;

// Top plate height
PLATE_HEIGHT = BED_HEIGHT;

// Stand
module photogametry_stand() { 
    // Bed
    cube(size = [BED_WIDTH, BED_WIDTH, BED_HEIGHT], center = true);
    
    // Pylon
    pylon_height = BEARING_HEIGHT * 3 + BED_HEIGHT;
    cylinder(pylon_height, BEARING_DIAMETER_INNER / 2 * 1.1, BEARING_DIAMETER_OUTTER / 2, center = false);
}

module photogametry_mount() {
    difference() {
        cylinder(h = BEARING_HEIGHT * 3, r = BEARING_DIAMETER_OUTTER / 2 * 1.25);
        cylinder(h = BEARING_HEIGHT * 2.5, r1 = BEARING_DIAMETER_OUTTER * 1.1 / 2, r2 = BEARING_DIAMETER_OUTTER * 0.95 / 2);
    }
    
    translate([0, 0, BEARING_HEIGHT * 2.8]) {
        cylinder(h = PLATE_HEIGHT, r = PLATE_DIAMETER, center = false);
    }
}

// Top plate
module photogametry_plate() {
    cylinder(BEARING_HEIGHT * 3, BEARING_DIAMETER_OUTTER * 5, BEARING_DIAMETER_OUTTER * 5);
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