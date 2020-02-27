class AddInfosToAdemeEmissionFactors < ActiveRecord::Migration[6.0]
  def change
    add_column :ademe_emission_factors, :id_ademe, :integer #id de la base ADEME
    add_column :ademe_emission_factors, :nom_base, :string #2eme nom
    add_column :ademe_emission_factors, :count, :integer # compteur independant
  end
end
