class AddCounterCacheToConsultations < ActiveRecord::Migration[6.0]
  def change
    add_column :consultations, :consultation_responses_count, :integer, default: 0
  end
end