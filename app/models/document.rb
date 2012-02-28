class Document < ActiveRecord::Base
  mount_uploader :document, DocumentUploader
end
