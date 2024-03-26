module Validation 
  def valid?
    validate!     
  rescue
    false        
  end

  def validate!
    unless self.is_a?(Route)
      raise "Имя должно состоять не менее чем из 6 символов" if name.size < 6        
    end
    case 
      when self.class.name == 'Route'
        raise "Начальная и конечная станция не могут быть nill" if self.stations_list.first.nil? || self.stations_list.last.nil?
        raise "Название начальной или конечной станции должно состоять не менее чем из 6 символов" if stations_list.first.length < 6 || self.stations.last.length < 6     
      when self.class.superclass == Train || self.is_a?(Train)
        raise "Номер не может быть nill" if number.nil?
        raise "Номер должен состоять из 6 символов" if number.size < 6 || number.size > 7
        raise "Номер имеет некорректный формат" if number !~ Train::NUMBER_FORMAT
        true    
      end
    end
end