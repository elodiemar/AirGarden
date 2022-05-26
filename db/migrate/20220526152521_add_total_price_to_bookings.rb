class AddTotalPriceToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :total_price, :integer
  end
end

db/migrate/20220526160659_change_date_to_date_time_for_start_and_end_date.rb
