class HealthTrack < ApplicationRecord
  belongs_to :dog

  def dog_score(breed, sex)
    breed_data = DogApiService.call(breed)

    return nil if breed_data.empty?

    # Determine which attributes to use based on the dog's sex
    if sex.downcase == 'male'
      min_weight = breed_data[0]['min_weight_male']
      max_weight = breed_data[0]['max_weight_male']
      min_height = breed_data[0]['min_height_male']
      max_height = breed_data[0]['max_height_male']
    elsif sex.downcase == 'female'
      min_weight = breed_data[0]['min_weight_female']
      max_weight = breed_data[0]['max_weight_female']
      min_height = breed_data[0]['min_height_female']
      max_height = breed_data[0]['max_height_female']
    else
      return nil # Return nil if sex is not 'male' or 'female'
    end

    # Calculate the average weight and height
    avg_weight = (min_weight + max_weight) / 2.0
    avg_height = (min_height + max_height) / 2.0

    # Calculate the weight-to-height ratio
    ideal_ratio = avg_weight / avg_height

    ratio_score = weight / height / ideal_ratio

    # find age factor
    dog = Dog.find(dog_id)
    age = Date.today - dog.birthdate
    age_score = 0

    min_life = breed_data[0]['min_life_expectancy']
    max_life = breed_data[0]['max_life_expectancy']
    avg_age = (min_life + max_life) / 2
    # if dog is older than max life expectancy
    if age > max_life
      age_score = 1
      # if dog is younger than min life expectancy
    elsif age < min_life
      age_score = 10 - (age / avg_age * 5)
    else
      age_score = 10 - (age / avg_age * 9)
    end

    (bcs * 0.4 + ratio_score * 0.2 + exercise * 0.2 + age_score * 0.2).round
  end

end
