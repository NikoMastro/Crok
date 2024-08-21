# user, dog, family, tasks, comments, health_tracks, medical_records
User.destroy_all
Dog.destroy_all
Task.destroy_all
Family.destroy_all
# family name
my_family = Family.new(
  name: "Inagaki"
)
my_family.save
puts "made family"

# user name role
ryuya = User.new(
  name: "Ryuya",
  role: "Parent",
  email: "test@mail.com",
  password:  "123123"
)
ryuya.family_id = my_family.id

if ryuya.save
  puts "made 1 users"
else
  puts ryuya.errors.full_messages
end

ryuya = User.new(
  name: "Joe",
  role: "Parent",
  email: "test3@mail.com",
  password:  "123123"
)
ryuya.family = my_family
if ryuya.save
  puts "made 1 users"
else
  puts ryuya.errors.full_messages
end

ryuya = User.new(
  name: "Mint",
  role: "Parent",
  email: "test2@mail.com",
  password:  "123123"
)
ryuya.family = my_family
if ryuya.save
  puts "made 1 users"
else
  puts ryuya.errors.full_messages
end

ryuya = User.new(
  name: "Sunjun",
  role: "Parent",
  email: "test1@mail.com",
  password:  "123123"
)
ryuya.family = my_family
if ryuya.save
  puts "made 1 users"
else
  puts ryuya.errors.full_messages
end
# pierre.save
# joe.save
# sunjun.save

# dog name breed birthday allergies
doug = Dog.new(
  name: "Pierre",
  breed: "golden retriever",
  sex: "male",
  birthdate: Date.new(2002, 2, 24)
)
doug.family_id = my_family.id
doug.save
puts "made 1 dog"


doug = Dog.new(
  name: "John",
  breed: "golden retriever",
  sex: "male",
  birthdate: Date.new(2002, 2, 24)
)
doug.family = my_family
doug.save
puts "made 1 dog"

doug = Dog.new(
  name: "Alex",
  breed: "golden retriever",
  sex: "male",
  birthdate: Date.new(2002, 2, 24)
)
doug.family = my_family
doug.save
puts "made 1 dog"

doug = Dog.new(
  name: "Snow White",
  breed: "golden retriever",
  sex: "male",
  birthdate: Date.new(2002, 2, 24)
)
doug.family = my_family
doug.save
puts "made 1 dog"
# tasks
test_task = Task.new(
  name: "test",
  status: false,
  start_time: "2024-08-19",
  end_time: "2024-08-19"
)
test_task.dog = doug
test_task.user = ryuya
if test_task.save
  puts "made 1 task"
end
