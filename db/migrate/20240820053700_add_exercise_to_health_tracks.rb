class AddExerciseToHealthTracks < ActiveRecord::Migration[7.1]
  def change
    add_column :health_tracks, :exercise, :integer
  end
end
