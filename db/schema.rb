# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120610124155) do

  create_table "ballot_overall_scoreblocks", :force => true do |t|
    t.integer  "raw_ballot_id"
    t.string   "choreographer_name"
    t.string   "choreography_score"
    t.string   "combat_choreographer_name"
    t.string   "combat_choreography_score"
    t.string   "music_director_name"
    t.string   "music_direction_score"
    t.string   "director_name"
    t.string   "direction_score"
    t.string   "overall_names"
    t.string   "overall_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comments"
    t.boolean  "choreographer_not_listed"
    t.boolean  "combat_choreographer_not_listed"
    t.boolean  "music_director_not_listed"
    t.boolean  "director_not_listed"
    t.boolean  "producer_sm_not_listed"
  end

  create_table "ballot_performer_scores", :force => true do |t|
    t.integer  "raw_ballot_id"
    t.string   "performer_name"
    t.string   "role_name"
    t.string   "performer_gender"
    t.string   "role_type"
    t.string   "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ballot_technical_scoreblocks", :force => true do |t|
    t.integer  "raw_ballot_id"
    t.string   "set_designer_name"
    t.string   "set_design_score"
    t.string   "set_construction_name"
    t.string   "set_construction_score"
    t.string   "set_painter_name"
    t.string   "set_painting_score"
    t.string   "set_decoration_name"
    t.string   "set_decoration_score"
    t.string   "properties_name"
    t.string   "properties_score"
    t.string   "light_designer_name"
    t.string   "light_design_score"
    t.string   "sound_designer_name"
    t.string   "sound_design_score"
    t.string   "sfx_name"
    t.string   "sfx_score"
    t.string   "costume_designer_name"
    t.string   "costume_design_score"
    t.string   "makeup_designer_name"
    t.string   "makeup_design_score"
    t.string   "hair_designer_name"
    t.string   "hair_design_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "set_designer_not_listed"
    t.boolean  "set_construction_not_listed"
    t.boolean  "set_painter_not_listed"
    t.boolean  "set_decoration_not_listed"
    t.boolean  "properties_not_listed"
    t.boolean  "light_designer_not_listed"
    t.boolean  "sound_designer_not_listed"
    t.boolean  "sfx_not_listed"
    t.boolean  "costume_designer_not_listed"
    t.boolean  "makeup_designer_not_listed"
    t.boolean  "hair_designer_not_listed"
  end

  create_table "producing_companies", :force => true do |t|
    t.string   "display_name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "raw_ballots", :force => true do |t|
    t.string   "show_title"
    t.string   "producing_company"
    t.date     "date_viewed",         :limit => 255
    t.string   "adjudicator_name"
    t.string   "adjudicator_email"
    t.string   "adjudicator_company"
    t.string   "adjudicator_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "production_type"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

end
