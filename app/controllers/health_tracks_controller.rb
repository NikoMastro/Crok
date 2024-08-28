class HealthTracksController < ApplicationController

  def index
    @health_tracks = HealthTrack.all
  end

  def show
    @health_track = HealthTrack.find(params[:id])
  end


  def new
    @exercise_level_tooltip =
    "Here are the 10 levels of exercising on a score activity for a dog, ranging from inactivity to hyperactivity:
    1. **Level 0**: 0 minutes of exercise – Dog is inactive, possibly resting or sleeping most of the day.
    2. **Level 1**: 5-10 minutes of exercise – Minimal activity, like a brief walk around the block.
    3. **Level 2**: 15-20 minutes of exercise – Light activity, such as a short play session or a slow walk.
    4. **Level 3**: 25-30 minutes of exercise – Mild exercise, including a moderate walk or light fetch play.
    5. **Level 4**: 35-40 minutes of exercise – Moderate activity, such as a brisk walk or an extended play session.
    6. **Level 5**: 45-50 minutes of exercise – Average exercise, like a regular walk or play session with some running.
    7. **Level 6**: 55-60 minutes of exercise – Above-average activity, including a long walk or a mix of walking and running.
    8. **Level 7**: 65-75 minutes of exercise – High activity, such as a long run or multiple play sessions.
    9. **Level 8**: 80-90 minutes of exercise – Very high activity, with intensive play, running, and possibly some agility training.
    10. **Level 10**: 100+ minutes of exercise – Extreme activity, with the dog being hyperactive, including long runs, multiple vigorous play sessions, and advanced agility or obedience training."

    @bcs_tooltip = "The Body Condition Score (BCS) is a scale used to assess a dog's body fat, typically ranging from 1 to 9. Here's a similar 10-level scale with details:
    1. **Level 0 (BCS 1)**: **Emaciated** – Ribs, lumbar vertebrae, pelvic bones, and all bony prominences are visible from a distance. No discernible body fat, and the dog has an obvious loss of muscle mass.
    2. **Level 1 (BCS 2)**: **Very Thin** – Ribs easily visible with minimal fat cover. Pelvic bones and waist are obvious when viewed from above. Muscle mass loss may be noticeable.
    3. **Level 2 (BCS 3)**: **Thin** – Ribs are easily felt with minimal fat cover. The waist is easily noticeable when viewed from above, and an abdominal tuck is apparent.
    4. **Level 3 (BCS 4)**: **Underweight** – Ribs are palpable with a slight fat cover, but not visible. The waist is defined, and the abdominal tuck is visible.
    5. **Level 4 (BCS 5)**: **Ideal** – Ribs can be felt without excess fat cover. The waist is observed behind the ribs when viewed from above, and the abdomen is tucked up when viewed from the side.
    6. **Level 5 (BCS 6)**: **Slightly Overweight** – Ribs are palpable with a slight excess of fat cover. The waist is discernible, but not as clearly defined. The abdominal tuck is minimal.
    7. **Level 6 (BCS 7)**: **Overweight** – Ribs are difficult to feel under a moderate fat cover. The waist is barely noticeable, and the abdominal tuck may be absent.
    8. **Level 7 (BCS 8)**: **Obese** – Ribs are difficult to feel under heavy fat cover. The waist is absent, and the abdomen may be rounded or distended when viewed from the side.
    9. **Level 8 (BCS 9)**: **Severely Obese** – Massive fat deposits over the ribs, spine, and base of the tail. No waist or abdominal tuck, and the dog may have difficulty moving or breathing normally.
    10. **Level 10 (BCS 10)**: **Morbidly Obese** – Ribs, spine, and pelvic bones are covered in heavy layers of fat. The dog may have pronounced difficulty moving, and obesity-related health problems are likely present."

    @health_track = HealthTrack.new
    @health_track.dog = Dog.find(params[:dog_id])
  end

  def create
    @health_track = HealthTrack.new(track_params)
    # raise
    @health_track.dog = Dog.find(params[:dog_id])
    if @health_track.save
      redirect_to :dog_id_health
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @health_track = HealthTrack.find(params[:dog_id])
    @dog = Dog.find(params[:id])
  end

  def update
    @health_track = HealthTrack.find(params[:id])
    if @health_track.update(track_params)
      redirect_to :dog_id_health
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @health_track = HealthTrack.find(params[:dog_id])
    @health_track.destroy!
    redirect_to :dog_id_health
  end

  private

  def track_params
    params.require(:health_track).permit(:weight, :height, :bcs, :exercise, :date)
  end

end
