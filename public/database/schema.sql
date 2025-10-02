-- Database Schema for CSE Motors
-- Create classification table
CREATE TABLE IF NOT EXISTS public.classification (
    classification_id SERIAL PRIMARY KEY,
    classification_name VARCHAR(50) NOT NULL UNIQUE
);
-- Create inventory table
CREATE TABLE IF NOT EXISTS public.inventory (
    inv_id SERIAL PRIMARY KEY,
    inv_make VARCHAR(50) NOT NULL,
    inv_model VARCHAR(50) NOT NULL,
    inv_year INTEGER NOT NULL CHECK (
        inv_year >= 1900
        AND inv_year <= 2100
    ),
    inv_description TEXT NOT NULL,
    inv_image VARCHAR(255) NOT NULL,
    inv_thumbnail VARCHAR(255) NOT NULL,
    inv_price DECIMAL(10, 2) NOT NULL CHECK (inv_price >= 0),
    inv_miles INTEGER NOT NULL CHECK (inv_miles >= 0),
    inv_color VARCHAR(50) NOT NULL,
    classification_id INTEGER NOT NULL,
    FOREIGN KEY (classification_id) REFERENCES public.classification(classification_id) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Insert sample classifications
INSERT INTO public.classification (classification_name)
VALUES ('Sedan'),
    ('SUV'),
    ('Truck'),
    ('Sports'),
    ('Luxury') ON CONFLICT (classification_name) DO NOTHING;
-- Insert sample inventory data
INSERT INTO public.inventory (
        inv_make,
        inv_model,
        inv_year,
        inv_description,
        inv_image,
        inv_thumbnail,
        inv_price,
        inv_miles,
        inv_color,
        classification_id
    )
VALUES (
        'Chevrolet',
        'Camaro',
        2022,
        'Powerful sports car with V8 engine, premium interior, and advanced technology features. Perfect condition with low mileage.',
        '/images/vehicles/camaro.jpg',
        '/images/vehicles/camaro-tn.jpg',
        35999.00,
        15420,
        'Red',
        4
    ),
    (
        'Ford',
        'F-150',
        2023,
        'America''s best-selling truck. Rugged, reliable, and ready for work or play. Includes towing package and off-road capabilities.',
        '/images/vehicles/f150.jpg',
        '/images/vehicles/f150-tn.jpg',
        42500.00,
        8750,
        'Blue',
        3
    ),
    (
        'Toyota',
        'Camry',
        2023,
        'Reliable mid-size sedan with excellent fuel economy, comfortable ride, and modern safety features. One owner, well maintained.',
        '/images/vehicles/camry.jpg',
        '/images/vehicles/camry-tn.jpg',
        28999.00,
        12000,
        'Silver',
        1
    ),
    (
        'Honda',
        'CR-V',
        2022,
        'Versatile compact SUV with spacious interior, all-wheel drive, and Honda Sensing safety suite. Perfect family vehicle.',
        '/images/vehicles/crv.jpg',
        '/images/vehicles/crv-tn.jpg',
        31250.00,
        18500,
        'White',
        2
    ),
    (
        'BMW',
        '5 Series',
        2023,
        'Luxury sedan with premium leather interior, advanced driver assistance, and powerful turbocharged engine. Executive comfort.',
        '/images/vehicles/bmw5.jpg',
        '/images/vehicles/bmw5-tn.jpg',
        52999.00,
        9200,
        'Black',
        5
    ),
    (
        'Tesla',
        'Model 3',
        2023,
        'All-electric sedan with autopilot, impressive range, and cutting-edge technology. Zero emissions, maximum performance.',
        '/images/vehicles/model3.jpg',
        '/images/vehicles/model3-tn.jpg',
        45999.00,
        5100,
        'White',
        1
    );
-- Create indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_inventory_classification ON public.inventory(classification_id);
CREATE INDEX IF NOT EXISTS idx_inventory_make_model ON public.inventory(inv_make, inv_model);
-- Grant permissions (adjust username as needed)
-- GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO your_username;
-- GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO your_username;