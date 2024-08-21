class MedicalRecordsController < ApplicationController

  def index
    @medical_records = MedicalRecord.all
    @dog = Dog.find(params[:dog_id])
  end

  def new
    @medical_record = MedicalRecord.new
    @dog = Dog.find(params[:dog_id])
  end

  def create
    @medical_record = MedicalRecord.new(record_params)
    @medical_record.dog = Dog.find(params[:dog_id])
    if @medical_record.save
      redirect_to dog_medical_records_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @medical_record = MedicalRecord.find(params[:id])
    if @medical_record.update(record_params)
      redirect_to "medical_records#index"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @medical_record = MedicalRecord.find(params[:id])
    @medical_record.destroy!
    redirect_to :dog_health
  end

  private

  def record_params
    params.require(:medical_record).permit(:date, :description, :vet_contact)
  end
end
