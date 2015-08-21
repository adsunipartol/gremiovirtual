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

ActiveRecord::Schema.define(version: 20141128165822) do

  create_table "alunos", force: true do |t|
    t.string   "matricula"
    t.string   "nome"
    t.string   "cpf"
    t.string   "email"
    t.string   "email_secundario"
    t.string   "endereco"
    t.string   "cep"
    t.string   "bairro"
    t.string   "telefone_principal"
    t.string   "telefone_secundario"
    t.date     "dtnascimento"
    t.boolean  "formado",             default: false
    t.boolean  "ativo",               default: false
    t.integer  "turma_id"
    t.integer  "colegio_id"
    t.integer  "usuario_id"
    t.integer  "cidade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alunos", ["cidade_id"], name: "index_alunos_on_cidade_id"
  add_index "alunos", ["colegio_id"], name: "index_alunos_on_colegio_id"
  add_index "alunos", ["turma_id"], name: "index_alunos_on_turma_id"
  add_index "alunos", ["usuario_id"], name: "index_alunos_on_usuario_id"

  create_table "assembleia_gerais", force: true do |t|
    t.integer  "colegio_id"
    t.date     "data_reuniao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assembleia_gerais", ["colegio_id"], name: "index_assembleia_gerais_on_colegio_id"

  create_table "cargo_funcionarios", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cargo_membro_chapas", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cargo_membro_comissao_eleitorais", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cargo_membro_conselho_fiscais", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cargo_representante_de_turmas", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chapas", force: true do |t|
    t.string   "nome"
    t.text     "plano_de_trabalho"
    t.boolean  "eleita",            default: false
    t.boolean  "finalizada",        default: false
    t.integer  "eleicao_gremio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chapas", ["eleicao_gremio_id"], name: "index_chapas_on_eleicao_gremio_id"

  create_table "cidades", force: true do |t|
    t.string   "nome"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cidades", ["estado_id"], name: "index_cidades_on_estado_id"

  create_table "colegios", force: true do |t|
    t.string   "nome"
    t.string   "nome_completo"
    t.string   "cnpj"
    t.string   "email"
    t.string   "cep"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "telefone"
    t.string   "fax"
    t.integer  "cidade_id"
    t.integer  "comissao_pro_gremio_id"
    t.integer  "gremio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "colegios", ["cidade_id"], name: "index_colegios_on_cidade_id"
  add_index "colegios", ["comissao_pro_gremio_id"], name: "index_colegios_on_comissao_pro_gremio_id"
  add_index "colegios", ["gremio_id"], name: "index_colegios_on_gremio_id"

  create_table "comissao_eleitorais", force: true do |t|
    t.integer  "gremio_id"
    t.integer  "ano_vigencia"
    t.boolean  "finalizada",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comissao_eleitorais", ["gremio_id"], name: "index_comissao_eleitorais_on_gremio_id"

  create_table "comissao_pro_gremios", force: true do |t|
    t.integer  "colegio_id"
    t.boolean  "finalizada", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comissao_pro_gremios", ["colegio_id"], name: "index_comissao_pro_gremios_on_colegio_id"

  create_table "conselho_fiscais", force: true do |t|
    t.integer  "gremio_id"
    t.integer  "ano_vigencia"
    t.boolean  "finalizado",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conselho_fiscais", ["gremio_id"], name: "index_conselho_fiscais_on_gremio_id"

  create_table "conselho_representantes_de_turmas", force: true do |t|
    t.integer  "colegio_id"
    t.integer  "ano_vigencia"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conselho_representantes_de_turmas", ["colegio_id"], name: "index_conselho_representantes_de_turmas_on_colegio_id"

  create_table "eleicao_gremios", force: true do |t|
    t.date     "data_inicio_inscricoes"
    t.date     "data_termino_inscricoes"
    t.date     "data_votacao"
    t.integer  "gremio_id"
    t.integer  "colegio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "eleicao_gremios", ["colegio_id"], name: "index_eleicao_gremios_on_colegio_id"
  add_index "eleicao_gremios", ["gremio_id"], name: "index_eleicao_gremios_on_gremio_id"

  create_table "estados", force: true do |t|
    t.string   "sigla"
    t.string   "nome"
    t.integer  "capital_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "estados", ["capital_id"], name: "index_estados_on_capital_id"

  create_table "funcionarios", force: true do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "email"
    t.string   "telefone"
    t.integer  "colegio_id"
    t.integer  "cargo_funcionario_id"
    t.integer  "cidade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "funcionarios", ["cargo_funcionario_id"], name: "index_funcionarios_on_cargo_funcionario_id"
  add_index "funcionarios", ["cidade_id"], name: "index_funcionarios_on_cidade_id"
  add_index "funcionarios", ["colegio_id"], name: "index_funcionarios_on_colegio_id"

  create_table "gremios", force: true do |t|
    t.string   "nome"
    t.integer  "ano_vigencia"
    t.integer  "chapa_eleita_id"
    t.integer  "colegio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gremios", ["colegio_id"], name: "index_gremios_on_colegio_id"

  create_table "membro_chapas", force: true do |t|
    t.integer  "aluno_id"
    t.integer  "chapa_id"
    t.integer  "cargo_membro_chapa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "membro_chapas", ["aluno_id"], name: "index_membro_chapas_on_aluno_id"
  add_index "membro_chapas", ["cargo_membro_chapa_id"], name: "index_membro_chapas_on_cargo_membro_chapa_id"
  add_index "membro_chapas", ["chapa_id"], name: "index_membro_chapas_on_chapa_id"

  create_table "membro_comissao_eleitorais", force: true do |t|
    t.integer  "aluno_id"
    t.integer  "comissao_eleitoral_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "membro_comissao_eleitorais", ["aluno_id"], name: "index_membro_comissao_eleitorais_on_aluno_id"
  add_index "membro_comissao_eleitorais", ["comissao_eleitoral_id"], name: "index_membro_comissao_eleitorais_on_comissao_eleitoral_id"

  create_table "membro_comissao_pro_gremios", force: true do |t|
    t.integer  "aluno_id"
    t.integer  "comissao_pro_gremio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "membro_comissao_pro_gremios", ["aluno_id"], name: "index_membro_comissao_pro_gremios_on_aluno_id"
  add_index "membro_comissao_pro_gremios", ["comissao_pro_gremio_id"], name: "index_membro_comissao_pro_gremios_on_comissao_pro_gremio_id"

  create_table "membro_conselho_fiscais", force: true do |t|
    t.integer  "aluno_id"
    t.integer  "cargo_membro_conselho_fiscal_id"
    t.integer  "conselho_fiscal_id"
    t.boolean  "suplente",                        default: false
    t.boolean  "efetivo",                         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "membro_conselho_fiscais", ["aluno_id"], name: "index_membro_conselho_fiscais_on_aluno_id"
  add_index "membro_conselho_fiscais", ["cargo_membro_conselho_fiscal_id"], name: "index_membro_conselho_fiscais_on_cargo_membro_conselho_fiscal"
  add_index "membro_conselho_fiscais", ["conselho_fiscal_id"], name: "index_membro_conselho_fiscais_on_conselho_fiscal_id"

  create_table "modelo_estatutos", force: true do |t|
    t.integer  "comissao_pro_gremio_id"
    t.boolean  "aprovado",               default: false
    t.text     "estatuto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "modelo_estatutos", ["comissao_pro_gremio_id"], name: "index_modelo_estatutos_on_comissao_pro_gremio_id"

  create_table "publicacoes", force: true do |t|
    t.integer  "usuario_id"
    t.date     "data"
    t.time     "hora"
    t.string   "titulo"
    t.text     "conteudo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publicacoes", ["usuario_id"], name: "index_publicacoes_on_usuario_id"

  create_table "representante_de_turmas", force: true do |t|
    t.integer  "aluno_id"
    t.integer  "turma_id"
    t.integer  "cargo_representante_de_turma_id"
    t.integer  "conselho_representantes_de_turma_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "representante_de_turmas", ["aluno_id"], name: "index_representante_de_turmas_on_aluno_id"
  add_index "representante_de_turmas", ["cargo_representante_de_turma_id"], name: "index_representante_de_turmas_on_cargo_representante"
  add_index "representante_de_turmas", ["conselho_representantes_de_turma_id"], name: "index_representante_de_turmas_on_conselho_rt"
  add_index "representante_de_turmas", ["turma_id"], name: "index_representante_de_turmas_on_turma_id"

  create_table "turmas", force: true do |t|
    t.integer  "ano_vigencia"
    t.string   "serie"
    t.string   "turno"
    t.string   "ensino"
    t.integer  "colegio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "turmas", ["colegio_id"], name: "index_turmas_on_colegio_id"

  create_table "usuarios", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nome"
    t.string   "cpf"
    t.integer  "aluno_id"
    t.integer  "funcionario_id"
    t.integer  "colegio_id"
    t.boolean  "admin",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["aluno_id"], name: "index_usuarios_on_aluno_id"
  add_index "usuarios", ["colegio_id"], name: "index_usuarios_on_colegio_id"
  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true
  add_index "usuarios", ["funcionario_id"], name: "index_usuarios_on_funcionario_id"
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true

  create_table "voto_eleicao_gremios", force: true do |t|
    t.integer  "eleicao_gremio_id"
    t.integer  "chapa_id"
    t.integer  "aluno_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "voto_eleicao_gremios", ["aluno_id"], name: "index_voto_eleicao_gremios_on_aluno_id"
  add_index "voto_eleicao_gremios", ["chapa_id"], name: "index_voto_eleicao_gremios_on_chapa_id"
  add_index "voto_eleicao_gremios", ["eleicao_gremio_id"], name: "index_voto_eleicao_gremios_on_eleicao_gremio_id"

end
