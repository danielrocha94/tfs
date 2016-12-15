# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161215115753) do

  create_table "account_viplist", id: false, force: :cascade do |t|
    t.integer "account_id", limit: 4,             null: false
    t.integer "world_id",   limit: 1, default: 0, null: false
    t.integer "player_id",  limit: 4,             null: false
  end

  add_index "account_viplist", ["account_id", "player_id"], name: "account_id_2", unique: true, using: :btree
  add_index "account_viplist", ["account_id"], name: "account_id", using: :btree
  add_index "account_viplist", ["player_id"], name: "player_id", using: :btree
  add_index "account_viplist", ["world_id"], name: "world_id", using: :btree

  create_table "accounts", force: :cascade do |t|
    t.string  "name",            limit: 32,  default: "",    null: false
    t.string  "password",        limit: 255,                 null: false
    t.string  "salt",            limit: 40,  default: "",    null: false
    t.integer "premdays",        limit: 4,   default: 0,     null: false
    t.integer "lastday",         limit: 4,   default: 0,     null: false
    t.string  "email",           limit: 255, default: "",    null: false
    t.string  "key",             limit: 32,  default: "0",   null: false
    t.boolean "blocked",                     default: false, null: false
    t.integer "warnings",        limit: 4,   default: 0,     null: false
    t.integer "group_id",        limit: 4,   default: 1,     null: false
    t.string  "password_digest", limit: 255
    t.string  "remember_digest", limit: 255
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree
  add_index "accounts", ["name"], name: "name", unique: true, using: :btree

  create_table "bans", force: :cascade do |t|
    t.boolean "type",                                   null: false
    t.integer "value",     limit: 4,                    null: false
    t.integer "param",     limit: 4,                    null: false
    t.boolean "active",                  default: true, null: false
    t.integer "expires",   limit: 4,     default: -1,   null: false
    t.integer "added",     limit: 4,                    null: false
    t.integer "admin_id",  limit: 4,     default: 0,    null: false
    t.text    "comment",   limit: 65535,                null: false
    t.integer "reason",    limit: 4,     default: 0,    null: false
    t.integer "action",    limit: 4,     default: 0,    null: false
    t.string  "statement", limit: 255,   default: "",   null: false
  end

  add_index "bans", ["active"], name: "active", using: :btree
  add_index "bans", ["type", "value"], name: "type", using: :btree

  create_table "environment_killers", id: false, force: :cascade do |t|
    t.integer "kill_id", limit: 4,   null: false
    t.string  "name",    limit: 255, null: false
  end

  add_index "environment_killers", ["kill_id"], name: "kill_id", using: :btree

  create_table "global_storage", id: false, force: :cascade do |t|
    t.string  "key",      limit: 32,                null: false
    t.integer "world_id", limit: 1,     default: 0, null: false
    t.text    "value",    limit: 65535,             null: false
  end

  add_index "global_storage", ["key", "world_id"], name: "key", unique: true, using: :btree

  create_table "guild_invites", id: false, force: :cascade do |t|
    t.integer "player_id", limit: 4, default: 0, null: false
    t.integer "guild_id",  limit: 4, default: 0, null: false
  end

  add_index "guild_invites", ["guild_id"], name: "guild_id", using: :btree
  add_index "guild_invites", ["player_id", "guild_id"], name: "player_id", unique: true, using: :btree

  create_table "guild_ranks", force: :cascade do |t|
    t.integer "guild_id", limit: 4,   null: false
    t.string  "name",     limit: 255, null: false
    t.integer "level",    limit: 4,   null: false
  end

  add_index "guild_ranks", ["guild_id"], name: "guild_id", using: :btree

  create_table "guilds", force: :cascade do |t|
    t.integer "world_id",     limit: 1,   default: 0, null: false
    t.string  "name",         limit: 255,             null: false
    t.integer "ownerid",      limit: 4,               null: false
    t.integer "creationdata", limit: 4,               null: false
    t.integer "checkdata",    limit: 4,               null: false
    t.string  "motd",         limit: 255,             null: false
  end

  add_index "guilds", ["name", "world_id"], name: "name", unique: true, using: :btree

  create_table "house_auctions", id: false, force: :cascade do |t|
    t.integer "house_id",  limit: 4,             null: false
    t.integer "world_id",  limit: 1, default: 0, null: false
    t.integer "player_id", limit: 4,             null: false
    t.integer "bid",       limit: 4, default: 0, null: false
    t.integer "limit",     limit: 4, default: 0, null: false
    t.integer "endtime",   limit: 8, default: 0, null: false
  end

  add_index "house_auctions", ["house_id", "world_id"], name: "house_id", unique: true, using: :btree
  add_index "house_auctions", ["player_id"], name: "player_id", using: :btree

  create_table "house_data", id: false, force: :cascade do |t|
    t.integer "house_id", limit: 4,                      null: false
    t.integer "world_id", limit: 1,          default: 0, null: false
    t.binary  "data",     limit: 4294967295,             null: false
  end

  add_index "house_data", ["house_id", "world_id"], name: "house_id", unique: true, using: :btree

  create_table "house_lists", id: false, force: :cascade do |t|
    t.integer "house_id", limit: 4,                 null: false
    t.integer "world_id", limit: 1,     default: 0, null: false
    t.integer "listid",   limit: 4,                 null: false
    t.text    "list",     limit: 65535,             null: false
  end

  add_index "house_lists", ["house_id", "world_id", "listid"], name: "house_id", unique: true, using: :btree

  create_table "houses", id: false, force: :cascade do |t|
    t.integer "id",          limit: 4,                   null: false
    t.integer "world_id",    limit: 1,   default: 0,     null: false
    t.integer "owner",       limit: 4,                   null: false
    t.integer "paid",        limit: 4,   default: 0,     null: false
    t.integer "warnings",    limit: 4,   default: 0,     null: false
    t.integer "lastwarning", limit: 4,   default: 0,     null: false
    t.string  "name",        limit: 255,                 null: false
    t.integer "town",        limit: 4,   default: 0,     null: false
    t.integer "size",        limit: 4,   default: 0,     null: false
    t.integer "price",       limit: 4,   default: 0,     null: false
    t.integer "rent",        limit: 4,   default: 0,     null: false
    t.integer "doors",       limit: 4,   default: 0,     null: false
    t.integer "beds",        limit: 4,   default: 0,     null: false
    t.integer "tiles",       limit: 4,   default: 0,     null: false
    t.boolean "guild",                   default: false, null: false
    t.boolean "clear",                   default: false, null: false
  end

  add_index "houses", ["id", "world_id"], name: "id", unique: true, using: :btree

  create_table "killers", force: :cascade do |t|
    t.integer "death_id",    limit: 4,                 null: false
    t.boolean "final_hit",             default: false, null: false
    t.boolean "unjustified",           default: false, null: false
  end

  add_index "killers", ["death_id"], name: "death_id", using: :btree

  create_table "player_deaths", force: :cascade do |t|
    t.integer "player_id", limit: 4, null: false
    t.integer "date",      limit: 8, null: false
    t.integer "level",     limit: 4, null: false
  end

  add_index "player_deaths", ["date"], name: "date", using: :btree
  add_index "player_deaths", ["player_id"], name: "player_id", using: :btree

  create_table "player_depotitems", id: false, force: :cascade do |t|
    t.integer "player_id",  limit: 4,                 null: false
    t.integer "sid",        limit: 4,                 null: false
    t.integer "pid",        limit: 4,     default: 0, null: false
    t.integer "itemtype",   limit: 4,                 null: false
    t.integer "count",      limit: 4,     default: 0, null: false
    t.binary  "attributes", limit: 65535,             null: false
  end

  add_index "player_depotitems", ["player_id", "sid"], name: "player_id_2", unique: true, using: :btree
  add_index "player_depotitems", ["player_id"], name: "player_id", using: :btree

  create_table "player_items", id: false, force: :cascade do |t|
    t.integer "player_id",  limit: 4,                 null: false
    t.integer "pid",        limit: 4,     default: 0, null: false
    t.integer "sid",        limit: 4,     default: 0, null: false
    t.integer "itemtype",   limit: 4,     default: 0, null: false
    t.integer "count",      limit: 4,     default: 0, null: false
    t.binary  "attributes", limit: 65535,             null: false
  end

  add_index "player_items", ["player_id", "sid"], name: "player_id_2", unique: true, using: :btree
  add_index "player_items", ["player_id"], name: "player_id", using: :btree

  create_table "player_killers", id: false, force: :cascade do |t|
    t.integer "kill_id",   limit: 4, null: false
    t.integer "player_id", limit: 4, null: false
  end

  add_index "player_killers", ["kill_id"], name: "kill_id", using: :btree
  add_index "player_killers", ["player_id"], name: "player_id", using: :btree

  create_table "player_namelocks", id: false, force: :cascade do |t|
    t.integer "player_id", limit: 4,               null: false
    t.string  "name",      limit: 255,             null: false
    t.string  "new_name",  limit: 255,             null: false
    t.integer "date",      limit: 8,   default: 0, null: false
  end

  add_index "player_namelocks", ["player_id"], name: "player_id", using: :btree

  create_table "player_skills", id: false, force: :cascade do |t|
    t.integer "player_id", limit: 4,             null: false
    t.integer "skillid",   limit: 1, default: 0, null: false
    t.integer "value",     limit: 4, default: 0, null: false
    t.integer "count",     limit: 4, default: 0, null: false
  end

  add_index "player_skills", ["player_id", "skillid"], name: "player_id_2", unique: true, using: :btree
  add_index "player_skills", ["player_id"], name: "player_id", using: :btree

  create_table "player_spells", id: false, force: :cascade do |t|
    t.integer "player_id", limit: 4,   null: false
    t.string  "name",      limit: 255, null: false
  end

  add_index "player_spells", ["player_id", "name"], name: "player_id_2", unique: true, using: :btree
  add_index "player_spells", ["player_id"], name: "player_id", using: :btree

  create_table "player_statements", force: :cascade do |t|
    t.integer "player_id",  limit: 4,               null: false
    t.integer "channel_id", limit: 4,   default: 0, null: false
    t.string  "text",       limit: 255,             null: false
    t.integer "date",       limit: 8,   default: 0, null: false
  end

  add_index "player_statements", ["channel_id"], name: "channel_id", using: :btree
  add_index "player_statements", ["player_id"], name: "player_id", using: :btree

  create_table "player_storage", id: false, force: :cascade do |t|
    t.integer "player_id", limit: 4,                   null: false
    t.string  "key",       limit: 32,    default: "0", null: false
    t.text    "value",     limit: 65535,               null: false
  end

  add_index "player_storage", ["player_id", "key"], name: "player_id_2", unique: true, using: :btree
  add_index "player_storage", ["player_id"], name: "player_id", using: :btree

  create_table "player_viplist", id: false, force: :cascade do |t|
    t.integer "player_id", limit: 4, null: false
    t.integer "vip_id",    limit: 4, null: false
  end

  add_index "player_viplist", ["player_id", "vip_id"], name: "player_id_2", unique: true, using: :btree
  add_index "player_viplist", ["player_id"], name: "player_id", using: :btree
  add_index "player_viplist", ["vip_id"], name: "vip_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string  "name",            limit: 255,                       null: false
    t.integer "world_id",        limit: 1,     default: 0,         null: false
    t.integer "group_id",        limit: 4,     default: 1,         null: false
    t.integer "account_id",      limit: 4,     default: 0,         null: false
    t.integer "level",           limit: 4,     default: 1,         null: false
    t.integer "vocation",        limit: 4,     default: 0,         null: false
    t.integer "health",          limit: 4,     default: 150,       null: false
    t.integer "healthmax",       limit: 4,     default: 150,       null: false
    t.integer "experience",      limit: 8,     default: 0,         null: false
    t.integer "lookbody",        limit: 4,     default: 0,         null: false
    t.integer "lookfeet",        limit: 4,     default: 0,         null: false
    t.integer "lookhead",        limit: 4,     default: 0,         null: false
    t.integer "looklegs",        limit: 4,     default: 0,         null: false
    t.integer "looktype",        limit: 4,     default: 136,       null: false
    t.integer "lookaddons",      limit: 4,     default: 0,         null: false
    t.integer "lookmount",       limit: 4,     default: 0,         null: false
    t.integer "maglevel",        limit: 4,     default: 0,         null: false
    t.integer "mana",            limit: 4,     default: 0,         null: false
    t.integer "manamax",         limit: 4,     default: 0,         null: false
    t.integer "manaspent",       limit: 8,     default: 0,         null: false
    t.integer "soul",            limit: 4,     default: 0,         null: false
    t.integer "town_id",         limit: 4,     default: 0,         null: false
    t.integer "posx",            limit: 4,     default: 0,         null: false
    t.integer "posy",            limit: 4,     default: 0,         null: false
    t.integer "posz",            limit: 4,     default: 0,         null: false
    t.binary  "conditions",      limit: 65535,                     null: false
    t.integer "cap",             limit: 4,     default: 0,         null: false
    t.integer "sex",             limit: 4,     default: 0,         null: false
    t.integer "lastlogin",       limit: 8,     default: 0,         null: false
    t.integer "lastip",          limit: 4,     default: 0,         null: false
    t.boolean "save_renamed",                  default: true,      null: false
    t.boolean "skull",                         default: false,     null: false
    t.integer "skulltime",       limit: 4,     default: 0,         null: false
    t.integer "rank_id",         limit: 4,     default: 0,         null: false
    t.string  "guildnick",       limit: 255,   default: "",        null: false
    t.integer "lastlogout",      limit: 8,     default: 0,         null: false
    t.integer "blessings",       limit: 1,     default: 0,         null: false
    t.boolean "pvp_blessing",                  default: false,     null: false
    t.integer "balance",         limit: 8,     default: 0,         null: false
    t.integer "stamina",         limit: 8,     default: 151200000, null: false
    t.integer "direction",       limit: 4,     default: 2,         null: false
    t.integer "loss_experience", limit: 4,     default: 100,       null: false
    t.integer "loss_mana",       limit: 4,     default: 100,       null: false
    t.integer "loss_skills",     limit: 4,     default: 100,       null: false
    t.integer "loss_containers", limit: 4,     default: 100,       null: false
    t.integer "loss_items",      limit: 4,     default: 100,       null: false
    t.integer "premend",         limit: 4,     default: 0,         null: false
    t.boolean "online",                        default: false,     null: false
    t.integer "marriage",        limit: 4,     default: 0,         null: false
    t.integer "promotion",       limit: 4,     default: 0,         null: false
    t.integer "deleted",         limit: 4,     default: 0,         null: false
    t.string  "description",     limit: 255,   default: "",        null: false
  end

  add_index "players", ["account_id"], name: "account_id", using: :btree
  add_index "players", ["deleted"], name: "deleted", using: :btree
  add_index "players", ["group_id"], name: "group_id", using: :btree
  add_index "players", ["name", "deleted"], name: "name", unique: true, using: :btree
  add_index "players", ["online"], name: "online", using: :btree

  create_table "server_config", id: false, force: :cascade do |t|
    t.string "config", limit: 35,  default: "", null: false
    t.string "value",  limit: 255, default: "", null: false
  end

  add_index "server_config", ["config"], name: "config", unique: true, using: :btree

  create_table "server_motd", id: false, force: :cascade do |t|
    t.integer "id",       limit: 4,                 null: false
    t.integer "world_id", limit: 1,     default: 0, null: false
    t.text    "text",     limit: 65535,             null: false
  end

  add_index "server_motd", ["id", "world_id"], name: "id", unique: true, using: :btree

  create_table "server_record", id: false, force: :cascade do |t|
    t.integer "record",    limit: 4,             null: false
    t.integer "world_id",  limit: 1, default: 0, null: false
    t.integer "timestamp", limit: 8,             null: false
  end

  add_index "server_record", ["record", "world_id", "timestamp"], name: "record", unique: true, using: :btree

  create_table "server_reports", force: :cascade do |t|
    t.integer "world_id",  limit: 1,     default: 0, null: false
    t.integer "player_id", limit: 4,     default: 1, null: false
    t.integer "posx",      limit: 4,     default: 0, null: false
    t.integer "posy",      limit: 4,     default: 0, null: false
    t.integer "posz",      limit: 4,     default: 0, null: false
    t.integer "timestamp", limit: 8,     default: 0, null: false
    t.text    "report",    limit: 65535,             null: false
    t.integer "reads",     limit: 4,     default: 0, null: false
  end

  add_index "server_reports", ["player_id"], name: "player_id", using: :btree
  add_index "server_reports", ["reads"], name: "reads", using: :btree
  add_index "server_reports", ["world_id"], name: "world_id", using: :btree

  create_table "tile_items", id: false, force: :cascade do |t|
    t.integer "tile_id",    limit: 4,                 null: false
    t.integer "world_id",   limit: 1,     default: 0, null: false
    t.integer "sid",        limit: 4,                 null: false
    t.integer "pid",        limit: 4,     default: 0, null: false
    t.integer "itemtype",   limit: 4,                 null: false
    t.integer "count",      limit: 4,     default: 0, null: false
    t.binary  "attributes", limit: 65535,             null: false
  end

  add_index "tile_items", ["sid"], name: "sid", using: :btree
  add_index "tile_items", ["tile_id", "world_id", "sid"], name: "tile_id", unique: true, using: :btree

  create_table "tile_store", id: false, force: :cascade do |t|
    t.integer "house_id", limit: 4,                      null: false
    t.integer "world_id", limit: 1,          default: 0, null: false
    t.binary  "data",     limit: 4294967295,             null: false
  end

  add_index "tile_store", ["house_id"], name: "house_id", using: :btree

  create_table "tiles", id: false, force: :cascade do |t|
    t.integer "id",       limit: 4,             null: false
    t.integer "world_id", limit: 1, default: 0, null: false
    t.integer "house_id", limit: 4,             null: false
    t.integer "x",        limit: 4,             null: false
    t.integer "y",        limit: 4,             null: false
    t.integer "z",        limit: 1,             null: false
  end

  add_index "tiles", ["house_id", "world_id"], name: "house_id", using: :btree
  add_index "tiles", ["id", "world_id"], name: "id", unique: true, using: :btree
  add_index "tiles", ["x", "y", "z"], name: "x", using: :btree

  add_foreign_key "environment_killers", "killers", column: "kill_id", name: "environment_killers_ibfk_1", on_delete: :cascade
  add_foreign_key "guild_invites", "guilds", name: "guild_invites_ibfk_2", on_delete: :cascade
  add_foreign_key "guild_invites", "players", name: "guild_invites_ibfk_1", on_delete: :cascade
  add_foreign_key "guild_ranks", "guilds", name: "guild_ranks_ibfk_1", on_delete: :cascade
  add_foreign_key "house_auctions", "houses", column: "world_id", primary_key: "world_id", name: "house_auctions_ibfk_1", on_delete: :cascade
  add_foreign_key "house_auctions", "houses", name: "house_auctions_ibfk_1", on_delete: :cascade
  add_foreign_key "house_auctions", "players", name: "house_auctions_ibfk_2", on_delete: :cascade
  add_foreign_key "house_data", "houses", column: "world_id", primary_key: "world_id", name: "house_data_ibfk_1", on_delete: :cascade
  add_foreign_key "house_data", "houses", name: "house_data_ibfk_1", on_delete: :cascade
  add_foreign_key "house_lists", "houses", column: "world_id", primary_key: "world_id", name: "house_lists_ibfk_1", on_delete: :cascade
  add_foreign_key "house_lists", "houses", name: "house_lists_ibfk_1", on_delete: :cascade
  add_foreign_key "killers", "player_deaths", column: "death_id", name: "killers_ibfk_1", on_delete: :cascade
  add_foreign_key "player_deaths", "players", name: "player_deaths_ibfk_1", on_delete: :cascade
  add_foreign_key "player_depotitems", "players", name: "player_depotitems_ibfk_1", on_delete: :cascade
  add_foreign_key "player_items", "players", name: "player_items_ibfk_1", on_delete: :cascade
  add_foreign_key "player_killers", "killers", column: "kill_id", name: "player_killers_ibfk_1", on_delete: :cascade
  add_foreign_key "player_killers", "players", name: "player_killers_ibfk_2", on_delete: :cascade
  add_foreign_key "player_namelocks", "players", name: "player_namelocks_ibfk_1", on_delete: :cascade
  add_foreign_key "player_skills", "players", name: "player_skills_ibfk_1", on_delete: :cascade
  add_foreign_key "player_spells", "players", name: "player_spells_ibfk_1", on_delete: :cascade
  add_foreign_key "player_statements", "players", name: "player_statements_ibfk_1", on_delete: :cascade
  add_foreign_key "player_storage", "players", name: "player_storage_ibfk_1", on_delete: :cascade
  add_foreign_key "player_viplist", "players", column: "vip_id", name: "player_viplist_ibfk_2", on_delete: :cascade
  add_foreign_key "player_viplist", "players", name: "player_viplist_ibfk_1", on_delete: :cascade
  add_foreign_key "players", "accounts", name: "players_ibfk_1", on_delete: :cascade
  add_foreign_key "server_reports", "players", name: "server_reports_ibfk_1", on_delete: :cascade
  add_foreign_key "tile_items", "tiles", name: "tile_items_ibfk_1", on_delete: :cascade
  add_foreign_key "tile_store", "houses", name: "tile_store_ibfk_1", on_delete: :cascade
  add_foreign_key "tiles", "houses", column: "world_id", primary_key: "world_id", name: "tiles_ibfk_1", on_delete: :cascade
  add_foreign_key "tiles", "houses", name: "tiles_ibfk_1", on_delete: :cascade
end
