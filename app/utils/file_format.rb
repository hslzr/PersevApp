class FileFormat
  MIME_LIST = YAML.load_file(
    File.join(__dir__, 'mime_types.yml')).freeze

  class << self
    def images
      MIME_LIST[:image_files]
    end

    def documents
      MIME_LIST[:general_files] + MIME_LIST[:word_files] +
        MIME_LIST[:excel_files] + MIME_LIST[:powerpoint_files]
    end
  end
end
