class RemoveIndexFromCatRentalRequest < ActiveRecord::Migration[5.2]
  def change
    remove_index "cat_rental_requests", name: "index_cat_rental_requests_on_cat_id"
  end
end
