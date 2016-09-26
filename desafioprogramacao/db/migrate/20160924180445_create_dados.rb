class CreateDados < ActiveRecord::Migration[5.0]
  def change
    create_table :dados do |t|
      t.string :comprador
      t.string :descricao
      t.string :preco_unitario
      t.string :quantidade
      t.string :endereco
      t.string :fornecedor

      t.timestamps
    end
  end
end
