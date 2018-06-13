namespace :settings do

  desc "Changes Setting key per_page_code for per_page_code_head"
  task per_page_code_migration: :environment do
    per_page_code_setting = Setting.where(key: 'per_page_code').first

    Setting['per_page_code_head'] = per_page_code_setting&.value.to_s if Setting.where(key: 'per_page_code_head').first.blank?
    per_page_code_setting.destroy if per_page_code_setting.present?
  end

  desc "Create new Attached Documents feature setting"
  task create_attached_documents_setting: :environment do
    Setting['feature.allow_attached_documents'] = true
  end

  desc "Initialize the values for the max size of files"
  task create_attached_documents_setting: :environment do
    Setting['feature.max_size']  = '3'
  end

  desc "Initialize the values for the max number of files"
  task create_attached_documents_setting: :environment do
    Setting['feature.max_number'] = '3'
  end

end
