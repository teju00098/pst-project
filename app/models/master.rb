class Master < ApplicationRecord
    require 'CSV'
    def self.import(file)
        data = []
        filename = File.basename(file)

        if filename.present?
          where(filename: filename).destroy_all
        end

        CSV.open(file, headers: :first_row).map do |rows|
            row = {filename: filename}
            barcodes = []
            rows.each do |f,v|
                if f.to_s.match(/Barcode\d{1,}/) 
                    barcodes.push(v) if v.present?
                else
                    row[f] = v
                end
            end
            row.merge!(created_at: DateTime.now, updated_at: DateTime.now)
            barcodes.each do |barcode|
                data.push(row.merge(BarcodeSBC: barcode))
            end
            if barcodes.blank?
                row[:BarcodeSBC] = row["BarcodeIBC"]
                data.push(row)
            end
        end
        Master.insert_all!(data)
    end

    def self.search(params)
        masters = Master.where("SKU LIKE ?", "%#{params[:search]}%") if params[:search].present?
        return masters
    end 
end
