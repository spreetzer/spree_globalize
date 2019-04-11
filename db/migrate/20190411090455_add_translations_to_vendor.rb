class AddTranslationsToVendor < ActiveRecord::Migration[5.2]
	def up
		unless table_exists?(:spree_vendor_translations)
		params = { name: :string , about_us: :text, contact_us: :text, address: :string, email: :string, speciality: :string }
		Spree::Vendor.create_translation_table!(params, { migrate_data: true })
		end
	end

	def down
		Spree::Vendor.drop_translation_table! migrate_data: true
	end
end
