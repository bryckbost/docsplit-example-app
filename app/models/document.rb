require 'split'
class Document < ActiveRecord::Base
  include Split
  mount_uploader :document, DocumentUploader
  
  def images
    Dir.glob("public/#{document.store_dir}/*.png").map{|f| f.gsub('public/', '')}
  end
  
  before_save :set_title
  after_create :extract_images
  
private
  def set_title
    self.title = Split.title(document.file.file)
  end
end
