class Document < ActiveRecord::Base

	validates :name, presence: true

	mount_uploader :doc_file, AttachmentUploader

end
