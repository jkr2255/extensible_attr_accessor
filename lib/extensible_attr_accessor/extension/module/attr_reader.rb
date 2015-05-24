#encoding:utf-8

class Module
  private
  alias_method :inextensible_attr_reader, :attr_reader
  def attr_reader(*args, &block)
    unless block_given?
      inextensible_attr_reader *args
      return
    end
    #with block
    args.each do |name|
      define_method name do
        raw_val = instance_variable_get "@#{name}"
        block.call raw_val
      end
    end
    nil
  end
end
