# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# new_game = Game.create! name: "Tom Clancy's Rainbow Six® Siege",
#                         igdb_id: 7360,
#                         image_id: 'ktvusahfu7kmoqbpjbkz'

def create_r6_game
  @r6_game = Game.create! name: "Tom Clancy's Rainbow Six® Siege",
                          igdb_id: 7360,
                          image_id: 'ktvusahfu7kmoqbpjbkz',
                          website: 'https://store.steampowered.com/app/359550/Tom_Clancys_Rainbow_Six_Siege/',
                          status: 'supported'
end

def create_admin
  @admin = Operator.create! name: 'admin',
                            password: Rails.application.credentials.admin[:password],
                            game_setting_id: @r6_game.id
end

def create_r6_characters
  r6_characters = [
    'Ash',
    'Bandit',
    'Blackbeard',
    'Blitz',
    'Buck',
    'Capitao',
    'Castle',
    'Caveira',
    'Doc',
    'Echo',
    'Ela',
    'Frost',
    'Fuze',
    'GIGN Recruit',
    'Glaz',
    'GSG9 Recruit',
    'Hibana',
    'IQ',
    'Jackal',
    'Jager',
    'Kapkan',
    'Lesion',
    'Mira',
    'Montagne',
    'Mute',
    'Pulse',
    'Rook',
    'SAS Recruit',
    'Sledge',
    'Smoke',
    'Spetsnaz Recruit',
    'SWAT Recruit',
    'Lord Tachanka',
    'Thatcher',
    'Thermite',
    'Twitch',
    'Valkyrie',
    'Ying'
  ]

  r6_characters.each do |character|
    Character.create! name: character,
                      game_id: @r6_game.id,
                      operator_id: @admin.id
  end
end

def create_r6_levels_locations
  r6_levels_locations = {
    bank: [
      'Printer Room',

      'Boulevard',
      'Jewelry Front',
      'Plaza',
      'Main Entrance',
      'Garage Ramp',
      'Exterior Parking',
      'Garage Roof',
      'Alley Access',
      'Back Alley Rooftop',
      'Back Alley',
      'High Roof',
      'Low Roof',
      'Vault',
      'Gold Vault',
      'Server Room Stairs',
      'Server Room',
      'CCTV Room',
      'Loading Dock',
      'Secure Hallway',
      'Sewer',
      'Lockers',
      'Vault Lobby',
      'Vault Entrance',
      'Main Stairway',
      'Bank Garage',
      'Elevators',
      'Tellers Office',
      'Archives',
      'Tellers',
      'Loan Office',
      'Office Hallway',
      'Skylight Stairwell',
      'Lobby',
      'Open Area',
      'Staff Room',
      'Electrical Room',
      'Admin Office',
      'ATMs',
      'Executive Hallway',
      'Front Desk',
      'Executive Lounge',
      'CEO Office',
      'Janitor Closet',
      'Hallway',
      'Terrace',
      'Stock Trading Room',
      'Conference Room'
    ],
    bartlett: [
      'Archway Hall',
      'Archway Hallway',
      'bathroom',
      'Campus Field',
      'Classroom',
      'Coat Room',
      'Compass Hallway',
      'Courtyard',
      'Central Hallway',
      'Dining Room',
      'East Balcony',
      'East Corridor',

      'Festival',
      'Front Entrance',
      'Front Office',
      'Front Patio',
      'Garden Pass',
      'Kitchen',
      'Lounge',
      'Lower Library',
      'Main Gate',
      'Main Office',
      'Model Hall',
      'Pantry',
      'Parking',
      'Piano Room',
      'Reading Room',
      'Roof',
      'Rowing Museum',
      'Service Room',
      'Trophy Room',
      'Upper Library',
      'Vista Hallway',
      'West Balcony',
      'West Corridor'
    ],
    border: [
      'Armory Lockers',
      'Venti- lation Room',
      'Exit Hallway',
      'Supply Corridor',
      'Detention',
      'Customs Inspection',
      'Customs Desk',
      'Central Stairs',
      'Supply Room',
      'Work- shop',
      'Main Lobby',
      'Waiting Room',
      'East Stairs',
      'Passport Check',
      'Offices',
      'Offices Hallway',
      'Fountain',
      'Main Hallway',
      'Armory Desk',
      'Security Room',
      'Break Room',
      'East Vehicle Entrance',

      'West Vehicle Exit',
      'West Tower',
      'Pedestrian Exit',
      'Valley',
      'Parking Lot Entrance',
      'Parking Lot',
      'West Road',
      'Vehicle Customs',
      'Crash Scene',
      'East Road',
      'Pedestrian Entrance',
      'Pedestrian Customs',
      'Watch Tower',
      'East Alley',
      'Parking Lot Alley',
      'North Balcony',

      'West Balcony',
      'South Balcony',
      'Roof'
    ],
    chalet: [
      'Front Yard',
      'Campfire',
      'Cliffside',
      'Lakeside',
      'Library Stairs',
      'Snowmobile Garage Corridor',
      'Snowmobile Garage',
      'Great Room Stairs',
      'Storage Room',
      'Wine Cellar',
      'Wine Stock',
      'Basement Hallway',
      'Backyard Stairs',
      'Main Stairs',
      'Main Garage',
      'Garage Entrance',
      'West Entrance',
      'Gaming Room Hallway',
      'Gaming Room',
      'Bar',
      'Great Room',
      'Dining Room',
      'Main Entrance',
      'Trophy Room',
      'Kitchen Hallway',
      'Kitchen',
      'Library Hallway',
      'Library Entrance',
      'Library',
      'Bedroom Terrace',
      'Fireplace Hallway',
      'Bedroom Hallway',
      'Master Bathroom',
      'Master Bedroom',
      'Office',
      'Wooden Trail',
      'Campfire Wood',
      'Backyard',
      'Gazeebo',
      'Cliffside Stairs',
      'Cliffside Woods',
      'Backyard Patio',
      'Office Balcony',
      'Helipad Trail',
      'Helipad',
      'Front Yard Patio',
      'Front Yard',
      'Bathroom Balcony',
      'Library Balcony',
      'Bedroom Balcony',
      'Snowmobiles'
    ],
    club: [
      'Main Entrance',
      'Shipping Docks',
      'Warehouse',
      'Construction Site',
      'Eastern Sub-roof',
      'Construction Site',
      'Container',
      'Graffiti Area',
      'Recreation Area',
      'Junkyard',
      'VIP Parking',
      'Main Gate',
      'Parking',
      'Kennels',
      'Trash',
      'Central Sub-roof',
      'Eastern Roof',
      'Central Roof',
      'Western Roof',
      'Balcony',
      'Escape Tunnel',
      'Arsenal Room',
      'Basement Hallway',
      'Memorial Room',
      'Utility Room',
      'Oil Pit',
      'Central Stairs',
      'Church',
      'Front Porch',
      'Garage',
      'Stock Room',
      'Garage Storage',
      'Lounge',
      'Bar',
      'Central Hallway',
      'Kitchen',
      'Kitchen Entrance',
      'Western Hallway',
      'Strip Club',
      'Junkyard Entrance',
      'Side Entrance',
      'Changing Room',
      'Bedroom',
      'Bathroom',
      'Bedroom Hallway',
      'Logistic Office',
      'Gym',
      'Secret Stash',
      'CCTV Room',
      'Cash Room',
      'Eastern Stairs'
    ],
    consulate: [
      'Riot Barricade',
      'Police Line',
      'Gas Station',
      'Side Entrance',
      'Exit Stairs',
      'Garage',
      'Basement Corridor',
      'Security Room',
      'Cafeteria',
      'Main Stairs',
      'Locker Hallway',
      'Service Stairs',
      'Electric Room',
      'Storage Room',

      'Archives Corridor',
      'Press Room',
      'West Corridor',
      'Public Bathroom',
      'Antechamber',
      'East Corridor',
      'Visa Office',
      'Visa Entrance',
      'Front Door',
      'Balcony',
      'Copy Room',
      'Cabinet',
      'Administration Office',
      'Break Room',
      'Front Office',
      'Meeting Room',
      'Hallway',
      'Consul Front Desk',
      'Private Bathroom',
      'Waiting Room',
      'Consulate Office',
      'Garage Way',
      'Courtyard',
      'Back Courtyard',
      'Side Entrance',
      'Dumpster',
      'Parking',
      'Gardens',
      'Fountain',
      'Emergency Exit',
      'Garage Roof',
      'Memorial Garden',
      'Police Line',
      'Riot Barracade',
      'East Front Yard',
      'West Front Yard',
      'Front Alley',
      'Building Roof'
    ],
    coastline: [
      'Aquarium',
      'Balcony',
      'Bathroom',
      'Billiards Room',
      'Blue Bar',
      'Cantina',
      'Courtyard',
      'DJ Booth',
      'Garage Roof',
      'Hall of Fame',
      'Hallway',
      'Hookah Deck',
      'Hookah Lounge',
      'Kitchen',
      'Main Entrance',
      'Main Lobby',
      'North Stairs',
      'Office',
      'Penthouse',
      'Pool',
      'Pool Entrance',
      'Pool Side',
      'Rooftop',
      'Ruins',
      'Security Room',
      'Service Entrance',
      'South Hallway',
      'South Promenade',
      'South Stairs',
      'Sunrise Bar',
      'Sun Room',
      'Theater',
      'Toilets',
      'VIP Lounge',
      'Walkway'
    ],
    favela: [
      'Packaging Room',
      'Football Apartment',
      'Armory Room',
      'Aunts Apartment',
      'Aunts Bedroom',
      'Grow Room',
      'Bikers Apartment',
      'Meth Lab',
      'Football Bedroom',
      'Football Office',
      'Bikers Bedroom',
      'Back Stairs',
      'Aunts Hall',
      'Kids Room',
      'Main Stairs',
      'Stair Hall',
      'Roof',
      'Laundry Room',
      'Vault Room',
      'Bikers Garage',
      'School Alley',
      'Football Pitch',
      'Market',
      'Market Alley',
      'School Rooftops',
      'Street',
      'Rooftops',
      'Courtyard',
      'Access Alley',
      'Shop',
      'Market Rooftops'
    ],
    hereford: [
      'Training Course',
      'Parking',
      'Shooting Range',
      'Armory',
      'Lockers',
      'Corridor',
      'Main Stairs',
      'Maintenance Area',
      'Briefing Room',
      'Basement Entrance',
      'Garage',
      'TV Room',
      'Garage Corridor',
      'Kitchen',
      'Corridor 1',
      'Dining Room',
      'Piano Lounge',
      'Office',
      'Master Bedroom',
      'Back Access',
      'Laundry Room',
      'Bathroom',
      'Kids Bedroom',
      'Ballistic Mat Depot',
      'Storage',
      'Storage Corridor',
      'Dummy Depot',
      'Workshop',
      'Shooting Range East Entrance',
      'Shooting Range West Entrance',
      'Tire Setting',
      'Observation Ramp',
      'Barracks',
      'Bus Back Alley',
      'Rappel Tower',
      'Front Access',
      'Chapel Gate',
      'Forklift Area',
      'Side Stairs Alley',
      'Side Stairs',
      'Garage Top',
      'Rooftop',
      'Parking Entrance'
    ],
    house: [
      'Construction Site',
      'River Docks',
      'APC Area',
      'Side Street',
      'Depot',
      'Training Room',
      'Kitchen Stairs',
      'Side Stairs',
      'Laundry Room',
      'Garage',
      'Living Room',
      'Back Entrance',
      'Kitchen',
      'Office',
      'Dining Room',
      'Workshop',
      'Kids Bedroom',
      'Upper Hallway',
      'Lobby Stairs',
      'Walk-in',
      'Master Bedroom',
      'Bathroom',
      'Side Street',
      'Garage Entrance',
      'Garden',
      'Patio',
      'Jacuzzi',
      'Basement Stairs',
      'Treehouse Alley',
      'Front Yard',
      'Front Street',
      'Front Porch',
      'Back Porch',
      'Back Porch Top',
      'Front Porch Top',
      'Rooftop'
    ],
    kanal: [
      'Floating Dock',
      'Sailboats',
      'Construction Site',
      'Boat Garage',
      'Boat Supplies',
      'Pipes',
      'Boat Supplies Hallway',
      'Locker Room',
      'Coast Guard Stairs',
      'Showers',
      'Showers Corridor',
      'Loading Dock',
      'Machine Hallway',
      'Control Center Stairs',
      'Holding Room',
      'Holding Room Hallway',
      'Radio',
      'Coast Guard Office',

      'Coast Guard Hall',
      'Main Entrance',
      'Lounge',
      'Bridge',
      'Model Room',
      'Security Room',
      'Projector Room',
      'Maps Office',
      'Maps Office Hallway',
      'Kitchen',
      'Cafeteria',
      'Plants Hallway',
      'Third Floor Exit',
      'Control Room',
      'Electric Room',
      'Control Room Hallway',
      'Lockgate',
      'Quay Containers',
      'Lockgate Tunnel',
      'Water Walkway',
      'Quay Construction',
      'Construction Site',
      'Construction Entrance',
      'Parking Alley',
      'Parking Entrance',
      'Middle Road',
      'Forklift Alley',
      'Front Lawn',
      'Basement Stairs',
      'Coast Guard Roof',
      'Bridge Roof',
      'Roof Brick Pile',
      'Balcony',
      'Control Center Roof',
      'Dock Stairs',
      'Parking',
      'Boat Crane',
      'Map Archives'
    ],
    kafe: [
      'River Docks',
      'Christmas Market',
      'Park',
      'Laundry Room',
      'Front Stairs',
      'Bakery',
      'Bakery Kitchen',
      'Kitchen Prep',
      'Kitchen Grill',
      'Kitchen Pick Up',
      'Cold Room',
      'Dining Room',
      'Back Stairs',
      'Cold Room Corridor',
      'VIP Section',
      'Bar Stairs',
      'Storage',
      'Museum Entrance',
      'Mining Room',
      'Train Museum',
      'Pillar Dining Room',
      'Main Corridor',
      'Reading Room Corridor',
      'Reading Room',
      'Fireplace Hall',
      'Cigar Shop',
      'Cigar Lounge',
      'Bar',
      'Bar Backstore',
      'Wash- rooms',
      'Washroom Corridor',
      'Cocktail Lounge',
      'Cocktail Lounge Entrance',
      'West Main Street',
      'Main Street',
      'East Main Street',
      'Bakery Parking',
      'Bakery Roof',
      'Cafe Roof Top',
      'Garrage',
      'Park Alley'
    ],
    oregon: [
      'Junkyard',
      'Street',
      'Construction Site',
      'Tower Stairs',
      'Boiler Room',
      'Electric Room',
      'Bunker Entrance',
      'Bunker',
      'Basement Corridor',
      'Supply Room',
      'Laundry Room',
      'Laundry Storage',
      'Laundry Stairs',
      'Office',
      'Dining Hall',
      'Dining Hall Corridor',
      'Showers',
      'Kitchen',
      'Bathroom',
      'Dorm Stairs',
      'Pantry',
      'Bathroom Corridor',
      'Classroom',

      'Main Stairs',
      'Meeting Hall',
      'Rear Stage',
      'Garage',
      'Office Storage',
      'Kids Dorm',
      'Dorm Main Hall',
      'Small Dorms',
      'Armory Corridor',
      'Master Bedroom',
      'Armory',
      'Walk In',
      'Attic',
      'Watch Tower',
      'Bus Yard',
      'Junkyard',
      'Farmlands',
      'Shooting Range',
      'Construction Site',
      'Parking',
      'Main Entrance',
      'Street',
      'Balcony',
      'Dining Hall Roof',
      'Office Roof',
      'Meeting Hall Entrance',
      'Garage Roof',
      'Dorms Roof',
      'Meeting Hall Roof',
      'Supply Closet'
    ],
    plane: [
      'Official Entrance',
      'Reporter Entrance',
      'Service Entrance',
      'Pr.BR',
      'Meeting Room',
      'Front Hallway',
      'Executive Office',
      'Main Entrance',
      'Front Stairs',
      'Pantry',
      'Kitchen',
      'Executive Hallway',
      'Executive Bedroom',
      'Change Room',
      'Laund.',
      'Front Service Entrance',
      'Right Wing',
      'Back Service Entrance',
      'Reporter Entrance',
      'Left Wing',
      'Staff Section',
      'Security Room',
      'Press Section A',
      'Press Section B',
      'Back Stairs',
      'Cargo Hold',
      'Service Corridor',
      'Storage',
      'Luggage Hold',
      'First Aid Station',
      'Cargo Front Entrance',
      'Cockpit Stairs',
      'Cabin Staff',
      'Radio Cabin',
      'Cabin',
      'Caterer',
      'Server Room A',
      'Server Room B',
      'Technical Seating',
      'Ladder Room'
    ],
    skyscraper: [
      'Helipad',
      'Tower',
      'Ventilation Units',
      'Kitchen',
      'Pantry',
      'Delivery Room',
      'House Lobby',
      'House Entrance',
      'Main Entrance',
      'Reception',
      'Bedroom',
      'Closet',
      'Bathroom',
      'House Stairs',
      'Restaurant',
      'Toilet',
      'BBQ',
      'Back Hallway',
      'Main Stairs',
      'Geisha Room',
      'Hallway',
      'Karaoke',
      'Tea Room',
      'Taiko',

      'Back Stairs',
      'House Balcony',
      'Exhibition',
      'Lounge',
      'Work Office',
      'Clearance',
      'Peacefull Tree',
      'Contemplation Garden',
      'West Garden',
      'Bridge',
      'Gazeebo',
      'Rest. Balcony',
      'North Garden',
      'East Garden',
      'Sand Garden',
      'Side Path',
      'Side Stairs',
      'Dragon Statue',
      'Covered Walkway'
    ],
    themepark: [
      'Arcade Roof',
      'Arcade Entrance',
      'Arcade Stairs',
      'Arcade Toilet',
      'Barrel Room',

      'Bumper Cars',
      'Bunk',
      'Bunk Toilet',
      'Cafe',
      'Cafe Corridor',
      'Cafe Stairs',
      'Cafe Terrace',
      'Cash Stash',
      'Coffin Room',
      'Control Room',
      'Crypt',
      'Day Care',
      'Drug Lab',
      'Drug Storage',
      'Execution Room',
      'Fuel Storage',
      'Gallery',
      'Gargoyle',
      'Gargoyle Storage',
      'Guest Info',
      'Haunted Balcony',
      'Haunted Dining',
      'Haunted Entrance',
      'Haunted Roof',
      'Haunted Shop',
      'Haunted Stairs',
      'Initiation Room',
      'Joint Corridor',
      'Lift Car',
      'Loading Deck',
      'Locker Room',
      'Main Entrance',
      'Office',
      'Office Toilet',
      'Palms',
      'Prop Storage',
      'Rail Overlook',
      'Rail Corridor',
      'Rail Platform',
      'Rail Ramp',
      'Robot Circuit',
      'Service Corridor',
      'Service Entry',
      'South Exit',
      'Sweet Shop',
      'Teacups',
      'Upper Arcade',
      'Village'
    ],
    tower: [
      'North Roof',
      'North Roof',
      'South Roof',
      'South Roof (now shown)',
      'Roof Access',
      'North Rappel',
      'South Rappel',
      'Mezzanine',
      'Ventilation',
      'Center Atrium',
      'Info Booth',
      'East Atrium',
      'West Atrium',

      'West Balcony',
      'Gallery Main',
      'Media Center',
      'Gallery Annex',
      'Gift Shop',
      'Exhibit Room',
      'Lantern Room',
      'Elevator',
      'Offices Hallway',
      'Exhibit Hallway',
      'Offices',
      'Company Reception',
      'Supply Room',
      'Meeting Room',
      'CEOs Office',
      'Bathroom',

      'North Stairs',
      'West Stairs',

      'Main Reception',
      'Center Hallway',
      'Tea Room',
      'Lounge',
      'Bar',
      'Kitchen',
      'Restaurant',
      'Bird Room',
      'Restaurant Reception',
      'Restaurant Hallway',
      'Bar Hallway',
      'West Observatory',
      'Bonsai Room',
      'Traditional Hall',
      'Game Room',
      'East Observatory',
      'Fountain',
      'North Air Duct',
      'East Air Duct',
      'West Air Duct'
    ],
    yacht: [
      'Submarine',
      'Zodiak',
      'Snow Mobile',
      'Maps Room',
      'Cockpit',
      'Cockpit Hallway',
      'Captains Office',
      'Cockpit Balcony',
      'Top Deck Stairs',
      'Helipad Entrance',
      'Helipad',
      'Spa Deck',
      'East Deck',
      'West Deck',
      'Front Deck',
      'Master Bedroom',
      'Casino',
      'Poker Room',
      'Bedroom Hallway',
      'Casino Hallway',
      'Globe Hallway',
      'Lounge',
      'Cafeteria',
      'Engine',
      'Back Entrance',
      'Rear Deck',
      'Engine Storage',
      'Engine Control',
      'Back Stairs',
      'Emergency Exit',
      'Engine Hallway',
      'Front Stairs',
      'Kitchen',
      'Staff Dormitory',
      'West Balcony',

      'Kitchen Hallway',
      'Kitchen Stairs',
      'Kitchen Pantry',
      'Infirmary',
      'Boreal Sub Room',
      'Cafeteria Hallway',
      'Engine Utility',
      'Submarine',
      'West Glacier',
      'East Hull Breach',
      'East Glacier',
      'Frozen River',
      'Zodiac',
      'West Hull Breach',
      'King of the World',
      'Roof',
      'Anchor',
      'Aklark Sub Entrance'
    ]
  }

  r6_levels_locations.each do |level, locations|
    new_level = Level.create! name: level, game_id: @r6_game.id,
                              operator_id: @admin.id
    locations.each do |location|
      new_location = Location.create! name: location, game_id: @r6_game.id,
                                      operator_id: @admin.id
      LevelLocation.create! level_id: new_level.id,
                            location_id: new_location.id
    rescue ActiveRecord::RecordNotUnique
      next
    end
  end
end

def create_mode
  Mode.create! name: 'Bomb', game_id: @r6_game.id, operator_id: @admin.id
end

def create_rainbow_six
  create_r6_game
  create_admin
  create_r6_characters
  create_r6_levels_locations
  create_mode
end

def create_strategies
  Strategy.create commander_id: @admin.id,
                  mode_id: 1,
                  level_id: 1,
                  game_id: 1,
                  name: 'Rush'
end

def create_objectives
  10.times do
    10.times do |i|
      Objective.create strategy_id: 1,
                       name: "Objective #{i + 1}",
                       priority: i + 1,
                       min_ops: i + 1,
                       max_ops: i + 2,
                       target_id: 1,
                       action: 'attack'
    end
  end
end

def create_room
  Room.create commander_id: 1, name: 'happy'
end

def create_operators
  100.times do |i|
    Operator.create name: "Op #{i}",
                    password: '123456',
                    game_setting_id: @r6_game.id
  end
end

create_rainbow_six
create_strategies
create_objectives
create_operators
create_room


@admin.add_role :admin