module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.prepend InstanceMethods 
  end

  module ClassMethods
    attr_accessor :instances
  end

  module InstanceMethods
    def initialize(*_args)
      super
      register_instance
    end
    
    private
    
    def register_instance
      self.class.instances = (self.class.instances || 0) + 1
    end
  end
end