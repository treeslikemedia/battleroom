require 'Faker'
require 'pry'

random_name_array = []
50.times { random_name_array << Faker::Name.first_name }

DATA_STRUCTURE_ACCESS_QUESTIONS = [
  {
    data_structure: ["Ender's Game", "Foundation", "Dune", "Cat's Cradle", "The Left Hand of Darkness", "Hitchhiker's Guide to the Galaxy", "Stranger in a Strange Land", "Sirens of Titan", "Brave New World"],
    possible_variable_names: ["sci_fi_books", "sci_fi_novels", "canonical_sci_fi_titles", "science_fiction_titles"],
    # if I'm working with arrays, all the students need to know is the value to add to the array
    # if I'm working with a hash, the students need to have a key to put into the hash, as well as a value.
      # What's more extensible. Having a single key and multiple possible values?
    possible_assignments: ["Lord of the Rings", "1984", "Farhenheit 451", "Animal Farm", "Watchmen", "The Stand", "2001", "Starship Troopers", "The Time Machine"]
  },
  # {
  #   data_structure: random_name_array,
  #   possible_variable_names: ["friends", "enemies", "co_workers", "old_pals", "new_friends"]
  # },
  # {
  #   data_structure: ["Patches", "Falstaff", "Whiskers", "Trousers", "Sammycat", "Dunbar", "Digsy", "Bubs", "Davy", "Tomcat", "Mr. Bigglesworth"],
  #   possible_variable_names: ["cat_names"]
  # },
  # {
  #   data_structure: ["Fixing a Hole", "Michelle", "I'll Follow the Sun", "Hey Jude", "In My Life", "A Day in the Life", "If I Needed Someone", "I'm Looking Through You", "Nowhere Man", "Dear Prudence", "Julia", "Good Night", "Something", "Sun King", "Carry That Weight", "Girl", "What Goes On", "The Word", "I'm So Tired", "Blackbird", "Piggies", "Rocky Racoon", "Cry Baby Cry", "Taxman", "Eleanor Rigby", "I'm Only Sleeping", "Yellow Submarine"],
  #   possible_variable_names: ["beatles_songs", "fav_beatles_tracks"]
  # },
  # {
  #   data_structure: ["When Harry Met Sally", "There's Something About Mary", "How to Lose a Guy in 10 Days", "Bridesmaids", "Knocked Up", "High Fidelity", "America's Sweethearts", "My Best Friend's Wedding", "Chasing Amy", "What Women Want", "Four Weddings and a Funeral", "About a Boy", "Notting Hill", "His Girl Friday"],
  #   possible_variable_names: ["rom_coms"]
  # },
  # {
  #   data_structure: ["Tide", "Clorox", "Wisk", "Cheer"],
  #   possible_variable_names: ["name_brand_detergents", "detergent_brands"]
  # },
  # {
  #   data_structure: ["The Moon and Antartica", "Frank's Wild Years", "Perfect From Now On", "Nighthawks at the Diner", "Songs From a Room", "Transformer", "Songs of Love and Hate", "Stereopathetic Soul Manure"],
  #   possible_variable_names: ["lyrically_brilliant_albums"]
  # },
  # {
  #   data_structure: ["Sixteen Stone", "Nirvana MTV Unplugged 1994", "Jagged Little Pill", "Ten", "Nevermind", "Illmatic", "The Downward Spiral", "Odelay", "Mellowgold", "All Eyez On Me", "Ready 2 Die", "Blur", "Parklife", "What's the Story (Morning Glory)?", "Definitely Maybe", "13", "Keep It Like a Secret", "...Come Down", "XO", "Exile in Guyville", "The Lonesome Crowded West", "Crooked Rain, Crooked Rain", "The Blue Album", "Pinkerton", "OK Computer", "The Bends", "Slanted & Enchanted"],
  #   possible_variable_names: ["classics_from_the_nineties"]
  # },
  {
    data_structure: {
      num_wishes: 3,
      location: ["Madison, WI", "Vancover, BC", "Denver, CO"].sample,
    },
    possible_variable_names: ["genie_encounter", "meeting_with_satan_at_crossroads", "wishing_well"]
  },
  # {
  #   data_structure: {
  #     tiring: true,
  #     distance: "13.1 miles",
  #   },
  #   possible_variable_names: ["brooklyn_half_marathon"]
  # },
  # {
  #   data_structure: {
  #     home_team: "Green Bay Packers",
  #     capacity: 72_928,
  #   },
  #   possible_variable_names: ["lambeau_field"]
  # },
  # {
  #   data_structure: {
  #     home_team: "Boston Red Sox",
  #     capacity: 37_400,
  #   },
  #   possible_variable_names: ["fenway_park"]
  # },
  # {
  #   data_structure: {
  #     stars: ["Ryan Gosling", "Rachel McAdams"],
  #     released: 2004,
  #   },
  #   possible_variable_names: ["the_notebook"]
  # },
  # {
  #   data_structure: {
  #     director: "Spike Jonze",
  #     released: 1999,
  #   },
  #   possible_variable_names: ["being_john_malkavich"]
  # },
  # {
  #   data_structure: {
  #     stars: ["Nicholas Cage", "Meryl Streep"],
  #     rt_rating: "98%",
  #   },
  #   possible_variable_names: ["adaptation"]
  # },
  # {
  #   data_structure: {
  #     screenwriter: "Charlie Kaufman",
  #     released: 2004,
  #   },
  #   possible_variable_names: ["eternal_sunshine"]
  # },
  # {
  #   data_structure: {
  #     stars: ["Al Pacino", "Robert De Niro"],
  #     sequel: true,
  #   },
  #   possible_variable_names: ["godfather_two"]
  # },
  # {
  #   data_structure: {
  #     stars: ["Jim Carrey", "Ed Harris"],
  #     released: 1998,
  #   },
  #   possible_variable_names: ["truman_show"]
  # },
]

# binding.pry
