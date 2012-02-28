module Split
  [:author, :date, :creator, :keywords, :producer, :subject, :title, :length].each do |key|
    module_eval <<-EOS
      def self.#{key}(current_path, opts={})
        ::Docsplit.extract_#{key}(current_path)
      end
    EOS
  end
  
  def extract_images(size)
    Docsplit.extract_images(current_path, :size => size, :format => :png, :output => images_dir)
  end
  
  def extract_text
    Docsplit.extract_text(current_path, :ocr => false, :output => text_dir)
  end
  
end
