# user, dog, family, tasks, comments, health_tracks, medical_records

# family name
my_family = Family.new(
  name: "Inagaki"
)
my_family.save

# user name role
ryuya = User.new(
  name: "Ryuya",
  role: "Parent"
)

pierre = User.new(
  name: "Pierre",
  role: "Child"
)

joe = User.new(
  name: "Joe",
  role: "Child"
)

sunjun = User.new(
  name: "Sunjun",
  role: "Child"
)
ryuya.family = my_family
pierre.family = my_family
joe.family = my_family
sunjun.family = my_family
ryuya.save
pierre.save
joe.save
sunjun.save

# dog name breed birthday allergies
doug = Dog.new(
  name: "Doug",
  breed: "golden retriever",
  birthdate: Date.new(2002, 2, 24)
)
doug.family = my_family
doug.save

# tasks
test_task = Task.new(
  name: "test",
  status: false,
  start_time: "2024-08-19",
  end_time: "2024-08-19"
)
test_task.save
