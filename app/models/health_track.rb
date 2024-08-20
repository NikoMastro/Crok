class HealthTrack < ApplicationRecord
  belongs_to :dog

  def ideal_w2h_ratio(breed, sex)
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

    ideal_ratio
  end

end
