#encoding:utf-8

class Module
  private
  alias_method :inextensible_attr_writer, :attr_writer
  def attr_writer(*args, &block)
    unless block_given?
      inextensible_attr_writer *args
      return
    end
    #with block
    args.each do |name|
      define_method "#{name}=" do |val|
        parsed_val = block.call val
        
        instance_variable_set "@#{name}", parsed_val
        
        val
      end
    end
    nil
  end
end
