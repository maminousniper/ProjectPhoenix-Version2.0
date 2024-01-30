if not um.main.property.apartmentStatus then return end

UM_apartments = {
    ['south'] = {
        type = 'apartment1',
        coords = vector4(-693.8, -1089.88, 13.69, 247.9),
        text = 'South Rockford Drive',
        features = {
            beds = '2 bd',
            bath = '2 ba',
            sqft = '2,300 sqft'
        },
        desc = 'An upscale dwelling featuring modern amenities and a desirable location, ideal for professionals and city enthusiasts.',
        star = 4,
        tag = "rent"
    },
    ['morningwood'] = {
        type = 'apartment2',
        coords = vector4(-1254.77, -404.6, 34.57, 124.53),
        text = 'Morningwood Blvd',
        features = {
            beds = '2 bd',
            bath = '2 ba',
            sqft = '1,800 sqft'
        },
        desc = 'A luxurious and prestigious residence, offering the finest amenities and a prime location for those who demand the best in urban living.',
        star = 5,
        tag = "rent"
    },
    ['integrity'] = {
        type = 'apartment3',
        coords = vector4(224.52, -625.15, 40.46, 248.28),
        text = 'Integrity Way',
        features = {
            beds = 'Studio',
            bath = '1 ba',
            sqft = '1,100 sqft'
        },
        desc = 'A comfortable and well-maintained apartment, offering a balance between convenience and affordability.',
        star = 3,
        tag = "rent"
    },
    ['tinsel'] = {
        type = 'apartment4',
        coords = vector4(-617.55, 5.74, 41.85, 359.29),
        text = 'Tinsel Towers',
        features = {
            beds = '1 bd',
            bath = '1 ba',
            sqft = '2,200 sqft'
        },
        desc = 'An upscale dwelling featuring modern amenities and a desirable location, ideal for professionals and city enthusiasts.',
        star = 5,
        tag = "rent"
    },
    ['fantastic'] = {
        type = 'apartment5',
        coords = vector4(311.69, -1080.13, 29.4, 100.58),
        text = 'Fantastic Plaza',
        features = {
            beds = 'Studio',
            bath = '1 ba',
            sqft = '800 sqft'
        },
        desc = 'A basic residence that provides essential amenities, suitable for those who prioritize budget over luxury.',
        star = 3,
        tag = "rent"
    },
}