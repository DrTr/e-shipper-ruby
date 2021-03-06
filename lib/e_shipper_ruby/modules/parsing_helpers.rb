module EShipper
  module ParsingHelpers
    def error_messages(xml_data)
      errors = []
      if self.respond_to?(:responses)
         errors << "E_shipper response is empty" if(self.responses.first && self.responses.first.xml.empty?)
      end
     
      xml_errors = xml_data.css('Error')
      unless xml_errors.empty?
        xml_errors.each do |xml_error|
         errors << try_extract(xml_error, 'Message')
        end
      end
      
      self.last_response.errors = errors if (!errors.empty?) && self.respond_to?(:responses) && self.last_response    
      errors
    end

    def try_extract(xml_node, value, mode=:normal)
      value = value.to_s.e_shipper_camel_case(mode)
      xml_node.attributes[value].content
    rescue NoMethodError
      ''
    end
    
    def try_direct_extract(xml_node, selector, attr = nil)
      attr ? xml_node.css(selector)[0][attr] : xml_node.css(selector)[0].content
    rescue NoMethodError
      ''
    end
    
    def data(xml_node, attrs, mode=:normal)
      data = {}
      attrs.each { |attr| data[attr] = try_extract(xml_node, attr, mode) }
      data
    end
  end
end