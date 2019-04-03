ActiveRecord::Schema.define(version: 20190402233940) do
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "city"
    t.text "description"
    t.datetime "start_time"
    t.string "address"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
