class Document < ActiveRecord::Base

	belongs_to :lab

	validates :name, :doc_file, presence: true

	mount_uploader :doc_file, AttachmentUploader

end
