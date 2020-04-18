class AddElementsToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :title, :string #titre
    add_column :articles, :header, :string #chapeau de l'article
    add_column :articles, :text, :string #contient le texte et les sous-titres
    add_column :articles, :category, :string, array: true, default: [] #par defaut, les array sont stockés comme des strings dans PostGresql
    add_column :articles, :author, :string
    # Ajouter des images
  end
end
