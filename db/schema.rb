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

ActiveRecord::Schema.define(:version => 20110617114525) do

  create_table "condclimas", :force => true do |t|
    t.integer  "zona_id"
    t.string   "nombre"
    t.decimal  "temp"
    t.decimal  "viento"
    t.decimal  "hielo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conductors", :force => true do |t|
    t.string   "nombre"
    t.decimal  "diametro"
    t.decimal  "seccion"
    t.decimal  "peso"
    t.decimal  "rmec"
    t.decimal  "coef_e"
    t.decimal  "coef_t"
    t.decimal  "imax"
    t.decimal  "relec"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parametros", :force => true do |t|
    t.string   "radical"
    t.string   "nombre"
    t.string   "desc"
    t.float    "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proyectos", :force => true do |t|
    t.string   "nombre"
    t.string   "comitente"
    t.string   "constructor"
    t.string   "proyectista"
    t.date     "fproyecto"
    t.string   "ubicacion"
    t.string   "descripcion"
    t.string   "expediente"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "conductor_e_id"
    t.integer  "conductor_g_id"
    t.integer  "zona_id"
    t.integer  "tconstructivo_id"
    t.float    "vmax"
    t.float    "retmax"
  end

  create_table "puntos", :force => true do |t|
    t.integer  "proyecto_id"
    t.string   "nombre"
    t.integer  "secuencia"
    t.decimal  "latitud"
    t.decimal  "longitud"
    t.decimal  "distancia"
    t.decimal  "angulo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reltramovanos", :force => true do |t|
    t.integer  "tramo_id"
    t.integer  "vano_id"
    t.float    "angulo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tramos", :force => true do |t|
    t.integer  "ttramo_id"
    t.integer  "secuencia"
    t.string   "nombre"
    t.integer  "cantidad"
    t.decimal  "angulo"
    t.integer  "proyecto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ttramos", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vanos", :force => true do |t|
    t.integer  "proyecto_id"
    t.string   "nombre"
    t.decimal  "vano"
    t.integer  "conductor_e_id"
    t.integer  "conductor_g_id"
    t.decimal  "tiromax_e"
    t.decimal  "flechamax_e"
    t.decimal  "tma_e"
    t.decimal  "tiromax_g"
    t.decimal  "flechamax_g"
    t.decimal  "tma_g"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "zonas", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
