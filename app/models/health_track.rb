# require_relative "../views/shared/test.html.erb"

class HealthTrack < ApplicationRecord
  belongs_to :dog

  DOG_DATA = {
    "Airedale Terrier" => { min_weight_male: 40, max_weight_male: 65, min_height_male: 21, max_height_male: 23, min_weight_female: 40, max_weight_female: 65, min_height_female: 21, max_height_female: 23, min_life_expectancy_male: 10, max_life_expectancy_male: 12, min_life_expectancy_female: 10, max_life_expectancy_female: 12 },
    "Akita" => { min_weight_male: 100, max_weight_male: 130, min_height_male: 24, max_height_male: 28, min_weight_female: 70, max_weight_female: 100, min_height_female: 23, max_height_female: 27, min_life_expectancy_male: 10, max_life_expectancy_male: 15, min_life_expectancy_female: 10, max_life_expectancy_female: 15 },
    "American Bulldog" => { min_weight_male: 75, max_weight_male: 125, min_height_male: 20, max_height_male: 27, min_weight_female: 60, max_weight_female: 100, min_height_female: 20, max_height_female: 25, min_life_expectancy_male: 10, max_life_expectancy_male: 14, min_life_expectancy_female: 10, max_life_expectancy_female: 14 },
    "American Pit Bull Terrier" => { min_weight_male: 30, max_weight_male: 60, min_height_male: 18, max_height_male: 21, min_weight_female: 30, max_weight_female: 50, min_height_female: 17, max_height_female: 20, min_life_expectancy_male: 12, max_life_expectancy_male: 16, min_life_expectancy_female: 12, max_life_expectancy_female: 16 },
    "Australian Cattle Dog" => { min_weight_male: 35, max_weight_male: 50, min_height_male: 18, max_height_male: 20, min_weight_female: 30, max_weight_female: 45, min_height_female: 17, max_height_female: 19, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Australian Shepherd" => { min_weight_male: 50, max_weight_male: 65, min_height_male: 20, max_height_male: 23, min_weight_female: 40, max_weight_female: 55, min_height_female: 18, max_height_female: 21, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Beagle" => { min_weight_male: 20, max_weight_male: 30, min_height_male: 13, max_height_male: 15, min_weight_female: 20, max_weight_female: 30, min_height_female: 13, max_height_female: 15, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Bearded Collie" => { min_weight_male: 55, max_weight_male: 65, min_height_male: 21, max_height_male: 24, min_weight_female: 50, max_weight_female: 60, min_height_female: 20, max_height_female: 23, min_life_expectancy_male: 12, max_life_expectancy_male: 14, min_life_expectancy_female: 12, max_life_expectancy_female: 14 },
    "Bedlington Terrier" => { min_weight_male: 17, max_weight_male: 23, min_height_male: 16, max_height_male: 17, min_weight_female: 15, max_weight_female: 21, min_height_female: 15, max_height_female: 16, min_life_expectancy_male: 12, max_life_expectancy_male: 14, min_life_expectancy_female: 12, max_life_expectancy_female: 14 },
    "Bernese Mountain Dog" => { min_weight_male: 85, max_weight_male: 115, min_height_male: 25, max_height_male: 27, min_weight_female: 70, max_weight_female: 95, min_height_female: 23, max_height_female: 25, min_life_expectancy_male: 7, max_life_expectancy_male: 10, min_life_expectancy_female: 7, max_life_expectancy_female: 10 },
    "Bichon Frise" => { min_weight_male: 10, max_weight_male: 20, min_height_male: 9, max_height_male: 11, min_weight_female: 8, max_weight_female: 18, min_height_female: 9, max_height_female: 11, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Black and Tan Coonhound" => { min_weight_male: 65, max_weight_male: 100, min_height_male: 22, max_height_male: 27, min_weight_female: 60, max_weight_female: 90, min_height_female: 21, max_height_female: 26, min_life_expectancy_male: 10, max_life_expectancy_male: 12, min_life_expectancy_female: 10, max_life_expectancy_female: 12 },
    "Bloodhound" => { min_weight_male: 80, max_weight_male: 110, min_height_male: 25, max_height_male: 27, min_weight_female: 70, max_weight_female: 100, min_height_female: 24, max_height_female: 26, min_life_expectancy_male: 10, max_life_expectancy_male: 12, min_life_expectancy_female: 10, max_life_expectancy_female: 12 },
    "Border Collie" => { min_weight_male: 30, max_weight_male: 45, min_height_male: 18, max_height_male: 22, min_weight_female: 25, max_weight_female: 40, min_height_female: 17, max_height_female: 21, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Boston Terrier" => { min_weight_male: 10, max_weight_male: 25, min_height_male: 10, max_height_male: 15, min_weight_female: 10, max_weight_female: 25, min_height_female: 10, max_height_female: 15, min_life_expectancy_male: 11, max_life_expectancy_male: 15, min_life_expectancy_female: 11, max_life_expectancy_female: 15 },
    "Boxer" => { min_weight_male: 65, max_weight_male: 80, min_height_male: 21, max_height_male: 25, min_weight_female: 50, max_weight_female: 65, min_height_female: 20, max_height_female: 24, min_life_expectancy_male: 10, max_life_expectancy_male: 12, min_life_expectancy_female: 10, max_life_expectancy_female: 12 },
    "Bracco Italiano" => { min_weight_male: 55, max_weight_male: 88, min_height_male: 21, max_height_male: 27, min_weight_female: 50, max_weight_female: 80, min_height_female: 20, max_height_female: 26, min_life_expectancy_male: 10, max_life_expectancy_male: 12, min_life_expectancy_female: 10, max_life_expectancy_female: 12 },
    "Brittany" => { min_weight_male: 30, max_weight_male: 40, min_height_male: 17, max_height_male: 21, min_weight_female: 25, max_weight_female: 35, min_height_female: 16, max_height_female: 20, min_life_expectancy_male: 12, max_life_expectancy_male: 14, min_life_expectancy_female: 12, max_life_expectancy_female: 14 },
    "Bulldog" => { min_weight_male: 40, max_weight_male: 50, min_height_male: 12, max_height_male: 15, min_weight_female: 40, max_weight_female: 50, min_height_female: 12, max_height_female: 15, min_life_expectancy_male: 8, max_life_expectancy_male: 12, min_life_expectancy_female: 8, max_life_expectancy_female: 12 },
    "Bullmastiff" => { min_weight_male: 100, max_weight_male: 130, min_height_male: 24, max_height_male: 27, min_weight_female: 80, max_weight_female: 110, min_height_female: 23, max_height_female: 26, min_life_expectancy_male: 8, max_life_expectancy_male: 10, min_life_expectancy_female: 8, max_life_expectancy_female: 10 },
    "Cairn Terrier" => { min_weight_male: 13, max_weight_male: 18, min_height_male: 9, max_height_male: 10, min_weight_female: 12, max_weight_female: 17, min_height_female: 8, max_height_female: 9, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Cavalier King Charles Spaniel" => { min_weight_male: 13, max_weight_male: 18, min_height_male: 12, max_height_male: 13, min_weight_female: 13, max_weight_female: 18, min_height_female: 12, max_height_female: 13, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Chesapeake Bay Retriever" => { min_weight_male: 65, max_weight_male: 80, min_height_male: 21, max_height_male: 26, min_weight_female: 55, max_weight_female: 70, min_height_female: 20, max_height_female: 25, min_life_expectancy_male: 10, max_life_expectancy_male: 13, min_life_expectancy_female: 10, max_life_expectancy_female: 13 },
    "Chinese Crested" => { min_weight_male: 9, max_weight_male: 13, min_height_male: 11, max_height_male: 13, min_weight_female: 9, max_weight_female: 13, min_height_female: 11, max_height_female: 13, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Chihuahua" => { min_weight_male: 2, max_weight_male: 6, min_height_male: 6, max_height_male: 9, min_weight_female: 2, max_weight_female: 6, min_height_female: 6, max_height_female: 9, min_life_expectancy_male: 12, max_life_expectancy_male: 16, min_life_expectancy_female: 12, max_life_expectancy_female: 16 },
    "Collie" => { min_weight_male: 60, max_weight_male: 75, min_height_male: 22, max_height_male: 26, min_weight_female: 50, max_weight_female: 65, min_height_female: 21, max_height_female: 25, min_life_expectancy_male: 12, max_life_expectancy_male: 14, min_life_expectancy_female: 12, max_life_expectancy_female: 14 },
    "Dachshund" => { min_weight_male: 16, max_weight_male: 32, min_height_male: 8, max_height_male: 11, min_weight_female: 15, max_weight_female: 30, min_height_female: 7, max_height_female: 11, min_life_expectancy_male: 12, max_life_expectancy_male: 16, min_life_expectancy_female: 12, max_life_expectancy_female: 16 },
    "Dalmatian" => { min_weight_male: 45, max_weight_male: 60, min_height_male: 22, max_height_male: 24, min_weight_female: 40, max_weight_female: 55, min_height_female: 20, max_height_female: 22, min_life_expectancy_male: 10, max_life_expectancy_male: 13, min_life_expectancy_female: 10, max_life_expectancy_female: 13 },
    "Doberman Pinscher" => { min_weight_male: 75, max_weight_male: 100, min_height_male: 26, max_height_male: 28, min_weight_female: 60, max_weight_female: 90, min_height_female: 24, max_height_female: 27, min_life_expectancy_male: 10, max_life_expectancy_male: 12, min_life_expectancy_female: 10, max_life_expectancy_female: 12 },
    "Dogue de Bordeaux" => { min_weight_male: 99, max_weight_male: 110, min_height_male: 23, max_height_male: 27, min_weight_female: 99, max_weight_female: 110, min_height_female: 22, max_height_female: 26, min_life_expectancy_male: 5, max_life_expectancy_male: 8, min_life_expectancy_female: 5, max_life_expectancy_female: 8 },
    "English Bulldog" => { min_weight_male: 40, max_weight_male: 50, min_height_male: 12, max_height_male: 15, min_weight_female: 40, max_weight_female: 50, min_height_female: 12, max_height_female: 15, min_life_expectancy_male: 8, max_life_expectancy_male: 12, min_life_expectancy_female: 8, max_life_expectancy_female: 12 },
    "English Cocker Spaniel" => { min_weight_male: 26, max_weight_male: 34, min_height_male: 15, max_height_male: 17, min_weight_female: 22, max_weight_female: 30, min_height_female: 14, max_height_female: 16, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "English Foxhound" => { min_weight_male: 60, max_weight_male: 70, min_height_male: 24, max_height_male: 27, min_weight_female: 55, max_weight_female: 65, min_height_female: 23, max_height_female: 26, min_life_expectancy_male: 10, max_life_expectancy_male: 13, min_life_expectancy_female: 10, max_life_expectancy_female: 13 },
    "Finnish Spitz" => { min_weight_male: 20, max_weight_male: 35, min_height_male: 16, max_height_male: 20, min_weight_female: 20, max_weight_female: 35, min_height_female: 16, max_height_female: 20, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Flat-Coated Retriever" => { min_weight_male: 60, max_weight_male: 80, min_height_male: 22, max_height_male: 27, min_weight_female: 55, max_weight_female: 75, min_height_female: 21, max_height_female: 26, min_life_expectancy_male: 10, max_life_expectancy_male: 13, min_life_expectancy_female: 10, max_life_expectancy_female: 13 },
    "German Shepherd" => { min_weight_male: 50, max_weight_male: 90, min_height_male: 22, max_height_male: 26, min_weight_female: 50, max_weight_female: 90, min_height_female: 22, max_height_female: 26, min_life_expectancy_male: 9, max_life_expectancy_male: 13, min_life_expectancy_female: 9, max_life_expectancy_female: 13 },
    "Giant Schnauzer" => { min_weight_male: 55, max_weight_male: 85, min_height_male: 23, max_height_male: 27, min_weight_female: 55, max_weight_female: 85, min_height_female: 23, max_height_female: 27, min_life_expectancy_male: 10, max_life_expectancy_male: 12, min_life_expectancy_female: 10, max_life_expectancy_female: 12 },
    "Golden Retriever" => { min_weight_male: 65, max_weight_male: 75, min_height_male: 22, max_height_male: 24, min_weight_female: 55, max_weight_female: 65, min_height_female: 21, max_height_female: 23, min_life_expectancy_male: 10, max_life_expectancy_male: 12, min_life_expectancy_female: 10, max_life_expectancy_female: 12 },
    "Great Dane" => { min_weight_male: 120, max_weight_male: 200, min_height_male: 28, max_height_male: 34, min_weight_female: 100, max_weight_female: 150, min_height_female: 26, max_height_female: 32, min_life_expectancy_male: 7, max_life_expectancy_male: 10, min_life_expectancy_female: 7, max_life_expectancy_female: 10 },
    "Irish Setter" => { min_weight_male: 60, max_weight_male: 70, min_height_male: 24, max_height_male: 27, min_weight_female: 50, max_weight_female: 60, min_height_female: 23, max_height_female: 26, min_life_expectancy_male: 11, max_life_expectancy_male: 14, min_life_expectancy_female: 11, max_life_expectancy_female: 14 },
    "Irish Terrier" => { min_weight_male: 25, max_weight_male: 27, min_height_male: 18, max_height_male: 20, min_weight_female: 22, max_weight_female: 25, min_height_female: 17, max_height_female: 19, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Italian Greyhound" => { min_weight_male: 8, max_weight_male: 12, min_height_male: 12, max_height_male: 15, min_weight_female: 8, max_weight_female: 12, min_height_female: 12, max_height_female: 15, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Jack Russell Terrier" => { min_weight_male: 13, max_weight_male: 17, min_height_male: 10, max_height_male: 12, min_weight_female: 13, max_weight_female: 17, min_height_female: 10, max_height_female: 12, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Keeshond" => { min_weight_male: 35, max_weight_male: 45, min_height_male: 17, max_height_male: 18, min_weight_female: 35, max_weight_female: 45, min_height_female: 17, max_height_female: 18, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Labrador Retriever" => { min_weight_male: 65, max_weight_male: 80, min_height_male: 22, max_height_male: 24, min_weight_female: 55, max_weight_female: 70, min_height_female: 21, max_height_female: 23, min_life_expectancy_male: 10, max_life_expectancy_male: 12, min_life_expectancy_female: 10, max_life_expectancy_female: 12 },
    "Lakeland Terrier" => { min_weight_male: 15, max_weight_male: 17, min_height_male: 14, max_height_male: 15, min_weight_female: 14, max_weight_female: 16, min_height_female: 13, max_height_female: 14, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Lhasa Apso" => { min_weight_male: 12, max_weight_male: 18, min_height_male: 10, max_height_male: 11, min_weight_female: 12, max_weight_female: 18, min_height_female: 10, max_height_female: 11, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Maltese" => { min_weight_male: 4, max_weight_male: 7, min_height_male: 8, max_height_male: 10, min_weight_female: 4, max_weight_female: 7, min_height_female: 8, max_height_female: 10, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Mastiff" => { min_weight_male: 120, max_weight_male: 230, min_height_male: 27, max_height_male: 34, min_weight_female: 100, max_weight_female: 150, min_height_female: 25, max_height_female: 32, min_life_expectancy_male: 6, max_life_expectancy_male: 10, min_life_expectancy_female: 6, max_life_expectancy_female: 10 },
    "Pekingese" => { min_weight_male: 7, max_weight_male: 14, min_height_male: 7, max_height_male: 9, min_weight_female: 7, max_weight_female: 14, min_height_female: 7, max_height_female: 9, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Pembroke Welsh Corgi" => { min_weight_male: 25, max_weight_male: 30, min_height_male: 10, max_height_male: 12, min_weight_female: 25, max_weight_female: 30, min_height_female: 10, max_height_female: 12, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Pomeranian" => { min_weight_male: 3, max_weight_male: 7, min_height_male: 7, max_height_male: 9, min_weight_female: 3, max_weight_female: 7, min_height_female: 7, max_height_female: 9, min_life_expectancy_male: 12, max_life_expectancy_male: 16, min_life_expectancy_female: 12, max_life_expectancy_female: 16 },
    "Poodle" => { min_weight_male: 10, max_weight_male: 15, min_height_male: 10, max_height_male: 15, min_weight_female: 10, max_weight_female: 15, min_height_female: 10, max_height_female: 15, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Shiba" => { min_weight_male: 18, max_weight_male: 24, min_height_male: 14.5, max_height_male: 16.5, min_weight_female: 15, max_weight_female: 20, min_height_female: 13.5, max_height_female: 15.5, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Shih Tzu" => { min_weight_male: 9, max_weight_male: 16, min_height_male: 9, max_height_male: 10, min_weight_female: 9, max_weight_female: 16, min_height_female: 9, max_height_female: 10, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Siberian Husky" => { min_weight_male: 45, max_weight_male: 60, min_height_male: 21, max_height_male: 23, min_weight_female: 35, max_weight_female: 50, min_height_female: 20, max_height_female: 22, min_life_expectancy_male: 12, max_life_expectancy_male: 15, min_life_expectancy_female: 12, max_life_expectancy_female: 15 },
    "Vizsla" => { min_weight_male: 45, max_weight_male: 65, min_height_male: 21, max_height_male: 24, min_weight_female: 40, max_weight_female: 60, min_height_female: 20, max_height_female: 23, min_life_expectancy_male: 12, max_life_expectancy_male: 14, min_life_expectancy_female: 12, max_life_expectancy_female: 14 },
    "West Highland White Terrier" => { min_weight_male: 15, max_weight_male: 22, min_height_male: 10, max_height_male: 11, min_weight_female: 15, max_weight_female: 22, min_height_female: 10, max_height_female: 11, min_life_expectancy_male: 12, max_life_expectancy_male: 16, min_life_expectancy_female: 12, max_life_expectancy_female: 16 }
    }

  def self.score_hash(dog)
    score_hash = []
    HealthTrack.where(dog_id: dog.id, date: (Date.today - 30)...).order(date: :asc).each{ |track| score_hash <<
                          [ track.date.strftime("%Y-%m-%d"), track.dog_score ] }
    score_hash
    # HealthTrack.where(dog_id: dog.id).map{ |track| bcs_hash[track.id] =
    #                    { track.date.strftime("%Y-%m-%d") => track.bcs}}
  end

  def self.weight_change(dog)
    old_track = HealthTrack.where(dog_id: dog.id, date: (Date.today - 30)...).order(date: :asc).first
    return "Not possible to add records older than 30 days" if old_track.nil?
    new_track = HealthTrack.where(dog_id: dog.id).order(date: :asc).last
    return "" if new_track.nil?

    weight_change = new_track.weight - old_track.weight
    days = (new_track.date - old_track.date).to_i

    if dog.sex.downcase == "male"
      pronoun = "He"
    else
      pronoun = "She"
    end

    if weight_change >= 0
      return "#{pronoun} gained #{weight_change.abs} lbs in #{days} days."
    else
      return "#{pronoun} lost #{weight_change.abs} lbs in #{days} days."
    end
  end

  def self.bcs_change(dog)
    old_track = HealthTrack.where(dog_id: dog.id, date: (Date.today - 30)...).order(date: :asc).first
    new_track = HealthTrack.where(dog_id: dog.id).order(date: :asc).last

    bcs_change = new_track.bcs - old_track.bcs
    # days = (new_track.date - old_track.date).to_i

    if dog.sex.downcase == "male"
      pronoun = "His"
    else
      pronoun = "Her"
    end

    if bcs_change >= 0
      return "#{pronoun} BCS increased by #{bcs_change.abs} in the same period."
    else
      return "#{pronoun} BCS decreased by #{bcs_change.abs} in the same period."
    end
  end

  def self.average_score(dog)
    if !has_data?(dog.breed)
      return "(Data not available)"
    else
      score_arr = []
      HealthTrack.where(dog_id: dog.id, date: (Date.today - 30)...).each{ |track| score_arr << track.dog_score }
      (score_arr.inject(0.0) { |sum, el| sum + el }.to_f / score_arr.size).round(2)
    end
  end

  def self.has_data?(breed)
    DOG_DATA[breed] != nil
  end

  def dog_score
    breed = dog.breed
    sex = dog.sex

    if !DOG_DATA[breed]
      return "Cannot find data on #{dog.name}'s breed"
    end

    if sex.downcase == 'male'
      min_weight = DOG_DATA[breed][:min_weight_male]
      max_weight = DOG_DATA[breed][:max_weight_male]
      min_height = DOG_DATA[breed][:min_height_male]
      max_height = DOG_DATA[breed][:max_height_male]
      min_life = DOG_DATA[breed][:min_life_expectancy_male]
      max_life = DOG_DATA[breed][:max_life_expectancy_male]
    elsif sex.downcase == 'female'
      min_weight = DOG_DATA[breed][:min_weight_female]
      max_weight = DOG_DATA[breed][:max_weight_female]
      min_height = DOG_DATA[breed][:min_height_female]
      max_height = DOG_DATA[breed][:max_height_female]
      min_life = DOG_DATA[breed][:min_life_expectancy_female]
      max_life = DOG_DATA[breed][:max_life_expectancy_female]
    else
      return "Gender not found"
    end

    # puts min_weight
    # puts max_weight
    # puts min_height
    # puts max_height

    avg_weight = (min_weight + max_weight) / 2.0
    avg_height = (min_height + max_height) / 2.0

    # puts "avg weight: #{avg_weight}"
    # puts "avg height: #{avg_height}"

    ideal_ratio = avg_weight / avg_height
    ratio_score = weight / height / ideal_ratio

    # puts ideal_ratio
    # puts ratio_score

    age = ((Date.today - dog.birthdate).to_f / 365)
    age_score = 0

    # puts "age: #{age}"

    avg_age = (min_life + max_life) / 2

    # puts "average age: #{avg_age}"

    if age > max_life
      age_score = 1
      # if dog is younger than min life expectancy
    elsif age < min_life
      age_score = 10 - (age / avg_age * 2)
    else
      age_score = 10 - (age / avg_age * 5)
    end

    bcs_score = 10 - (bcs - 5).abs

    (bcs_score * 0.4 + ratio_score * 0.2 + exercise * 0.2 + age_score * 0.2).round

  end

  # def bcs
  #   bcs
  # end
end
