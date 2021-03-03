echo(version=version());

// Bed settings
BED_WIDTH = 50;
BED_HEIGHT = 5;

// Bearing settings
BEARING_DIAMETER_INNER = 7.5;
BEARING_DIAMETER_OUTTER = 21.5;
BERING_HEIGHT = 10;

// Plate settings
PLATE_DIAMETER = BED_WIDTH / 2;
PLATE_HEIGHT = 10;

// Helper function for plate
module circle_ring(radius, thickness) {
    difference() {
        circle(radius, $fn = 48);
        circle(radius - thickness, , $fn = 48);
    }
}

// Full stand
module photogametry_stand() { 
    // Bed
    cube(size = [BED_WIDTH, BED_WIDTH, BED_HEIGHT], center = true);
    
    // Pylon
    pylon_height = BERING_HEIGHT * 3 + BED_HEIGHT;
    cylinder(pylon_height, BEARING_DIAMETER_INNER * 1.1, BEARING_DIAMETER_INNER * 0.95, center = false);
    
    // Top plate
    // translate([0, 0, pylon_height * 2]);
    // circle_ring(10, 10);
    
}

photogametry_stand();