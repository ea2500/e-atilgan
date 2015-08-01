class Document < ActiveRecord::Base

	belongs_to :lab

	validates :name, :data, :lab_id, presence: true

	# mount_uploader :doc_file, AttachmentUploader

end
