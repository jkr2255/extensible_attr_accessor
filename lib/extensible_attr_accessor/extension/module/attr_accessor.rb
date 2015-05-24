#encoding:utf-8

class Module
  private
  alias_method :inextensible_attr_accessor, :attr_accessor
  def attr_accessor(*args, &block)
    unless block_given?
      inextensible_attr_accessor *args
      return
    end
    #with block
    args.each do |name|
      define_method name do
        raw_val = instance_variable_get "@#{name}"
        block.call raw_val, :get
      end
      define_method "#{name}=" do |val|
        parsed_val = block.call val, :set
        
        instance_variable_set "@#{name}", parsed_val
        
        val
        
      end
    end
    nil
  end
end
