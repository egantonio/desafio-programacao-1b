class DadosController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    respond_to do |format|
      format.html

      format.json {
        render json: Dado.all
      }
      end
  end

  def upload
    require 'csv'

    if !params[:file].present?
      render text: "Selecione o arquivo...", status: 422
      return
    end

    path =  params[:file].original_filename

    #File.open(path, "wb") { |f| f.write(params[:file].read) }
    #csv_text = File.read(path)
    #csv_textParse = csv_text.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n,'').downcase.to_s

    header = 0
    CSV.foreach(path, {:col_sep => "\t", :quote_char => '&', :write_headers => false,
                           :headers => [:comprador, :descricao, :preco, :quantidade, :endereco, :fornecedor]}
    ) do |row|
        if header > 0
        Dado.create(:comprador => row[:comprador],
                    :descricao => row[:descricao],
                    :preco_unitario => row[:preco],
                    :quantidade => row[:quantidade],
                    :endereco => row[:endereco],
                    :fornecedor => row[:fornecedor] )
        end
        header = header + 1
    end
  end
end
