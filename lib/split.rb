module Split
  [:author, :date, :creator, :keywords, :producer, :subject, :title, :length].each do |key|
    module_eval <<-EOS
      def self.#{key}(file, opts={})
        Docsplit.extract_#{key}(file)
      end
    EOS
  end
  
  def extract_images(size="700x")
    Docsplit.extract_images(document.file.file, :size => size, :format => :png, :output => "public/#{document.store_dir}")
    true
  end
  
  def extract_text
    Docsplit.extract_text(document.file.file, :ocr => false, :output => document.store_dir)
    true
  end  
end
