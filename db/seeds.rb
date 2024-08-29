# user, dog, family, tasks, comments, health_tracks, medical_records
User.destroy_all
Dog.destroy_all
Task.destroy_all
Family.destroy_all
# family name
my_family = Family.new(
  name: "Home is where love is"
)
my_family.save
puts "made family"

# user name role
ryuya = User.new(
  name: "Ryuya",
  role: "Parent",
  email: "test@gmail.com",
  password:  "123123",
)
ryuya.family = my_family
ryuya.photo.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', 'avatars', 'ryuya_avatar.jpeg')),
  filename: 'ryuya_avatar.jpeg',
  content_type: 'image/jpeg'
)
if ryuya.save
  puts "Ryuya OK"
else
  puts ryuya.errors.full_messages
end

joe = User.new(
  name: "Joe",
  role: "Parent",
  email: "test3@gmail.com",
  password:  "123123",
)
joe.family = my_family
joe.photo.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', 'avatars', 'Joe_avatar.jpeg')),
  filename: 'Joe_avatar.jpeg',
  content_type: 'image/jpeg'
)
if joe.save
  puts "Joe OK"
else
  puts joe.errors.full_messages
end

sunjun = User.new(
  name: "Sunjun",
  role: "Parent",
  email: "test1@gmail.com",
  password:  "123123",
)
sunjun.family = my_family
sunjun.photo.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', 'avatars', 'sunjun_avatar.png')),
  filename: 'sunjun_avatar.png',
  content_type: 'image/png'
)
if sunjun.save
  puts "Sunjun OK"
else
  puts sunjun.errors.full_messages
end

niko = User.new(
  name: "Niko",
  role: "Parent",
  email: "test5@gmail.com",
  password:  "123123",
)
niko.family = my_family
niko.photo.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', 'avatars', 'niko_avatar.jpeg')),
  filename: 'niko_avatar.jpeg',
  content_type: 'image/jpeg'
)
if niko.save
  puts "Niko OK"
else
  puts niko.errors.full_messages
end


# dog name breed birthday allergies
ange = Dog.new(
  name: "Ange",
  breed: "Golden Retriever",
  sex: "female",
  birthdate: Date.new(2008, 2, 24)
)
ange.family_id = my_family.id
ange.photos.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', 'dog_avatars', 'golden2.jpg')),
  filename: 'ange_avatar.jpg',
  content_type: 'image/jpg'
)
ange.save
puts "made 1 dog"


bibi = Dog.new(
  name: "Bibi",
  breed: "Chihuahua",
  sex: "female",
  birthdate: Date.new(2015, 2, 24)
)
bibi.family = my_family
bibi.photos.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', 'dog_avatars', 'Chihuahua3.jpg')),
  filename: 'bibi_avatar.jpg',
  content_type: 'image/jpg'
)
bibi.save
puts "made 1 dog"

milo = Dog.new(
  name: "Milo",
  breed: "Dalmatian",
  sex: "male",
  birthdate: Date.new(2016, 8, 27)
)
milo.family = my_family
milo.photos.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', 'dog_avatars', 'dalmatian1.jpg')),
  filename: 'milo_avatar.jpg',
  content_type: 'image/jpg'
)
milo.save
puts "made 1 dog"

yuki = Dog.new(
  name: "Yuki",
  breed: "Shiba",
  sex: "male",
  birthdate: Date.new(2020, 8, 27)
)
yuki.family = my_family
yuki.photos.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', 'dog_avatars', 'shiba1.jpg')),
  filename: 'yuki_avatar.jpg',
  content_type: 'image/jpg'
)
yuki.save
puts "made 1 dog"

anold = Dog.new(
  name: "Anold",
  breed: "Golden Retriever",
  sex: "male",
  birthdate: Date.new(2010, 5, 27)
)
anold.family = my_family
anold.photos.attach(
  io: File.open(Rails.root.join('app', 'assets', 'images', 'dog_avatars', 'golden0.jpg')),
  filename: 'anold_avatar.jpg',
  content_type: 'image/jpg'
)
anold.save
puts "made 1 dog"


# Assuming User and Dog objects are already created as per your seed

# Array of task types
task_types = ["Walk 🦮🚶🏻", "Vet Appointment 💊", "Dog Assembly 🐕", "Play this evening ⚽️", "Shower 🧼",]

# Array of users for task assignment
users = [ryuya, joe, sunjun, niko]

# Date range (first of this month to the last day of next month)
start_date = Date.today.beginning_of_month
end_date = (Date.today.next_month).end_of_month

# Function to generate random tasks
def create_random_tasks(dog, task_type, users, start_date, end_date)
  5.times do
    # Generate a random date within the range
    random_date = rand(start_date..end_date)

    # Select a random user
    random_user = users.sample

    # Create the task
    task = Task.new(
      name: task_type,
      status: false,
      start_time: random_date,
      end_time: random_date
    )
    task.dog = dog
    task.user = random_user
    if task.save
      puts "#{task_type} task for #{dog.name} on #{random_date} by #{random_user.name} saved successfully."
    else
      puts task.errors.full_messages
    end
  end
end

# Loop through each dog and create random tasks
[ange, bibi, milo, yuki, anold].each do |dog|
  task_types.each do |task_type|
    create_random_tasks(dog, task_type, users, start_date, end_date)
  end
end
