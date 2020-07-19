class CreateSiteGenerators < ActiveRecord::Migration[5.2]
    def change
        create_table :site_generators do |t|
            t.string :url
        end
    end
end