require 'spec_helper'

describe 'module#attr_writer' do
  
  it 'is a private method' do
    expect {Class.attr_writer}.to raise_error(NoMethodError)
  expect {Class.method(:attr_writer)}.not_to raise_error
  end
  
  context 'without block' do
    let(:test_class) do
      Class.new do
        attr_writer :foo, :bar
      end
    end
    
    it 'properly works' do
      t=test_class.new
      expect {t.foo=3}.not_to raise_error
      expect {t.bar=5}.not_to raise_error
      expect(t.instance_variable_get(:@foo)).to eq(3)
      expect(t.instance_variable_get(:@bar)).to eq(5)
    end
  end
  
  context 'with a block' do
    let(:test_class) do
      Class.new do
        attr_writer(:foo, :bar){ |val| val.capitalize }
      end
    end
    
    it 'properly works' do
      t=test_class.new
      foo_other=t.foo='foo'
      bar_other=t.bar='bar'
      expect(t.instance_variable_get(:@foo)).to eq('Foo')
      expect(t.instance_variable_get(:@bar)).to eq('Bar')
      expect(foo_other).to eq('foo')
      expect(bar_other).to eq('bar')
    end
    
  end
  
end
