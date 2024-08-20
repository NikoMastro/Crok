class MedicalRecordsController < ApplicationController

  def index
    @medical_records = MedicalRecord.all
  end

end
