require 'spec_helper'

describe 'module#attr_reader' do
  
  it 'is a private method' do
    expect {Class.attr_reader}.to raise_error(NoMethodError)
  expect {Class.method(:attr_reader)}.not_to raise_error
  end
  
  context 'without block' do
    let(:test_class) do
      Class.new do
        attr_reader :foo, :bar
      end
    end
    
    it 'properly works' do
      t=test_class.new
      t.instance_variable_set(:@foo,5)
      t.instance_variable_set(:@bar,10)
      expect(t.foo).to be(5)
      expect(t.bar).to be(10)
    end
  end
  
  context 'with a block' do
    let(:test_class) do
      Class.new do
        attr_reader(:foo, :bar){ |val| val.to_s }
      end
    end
    
    it 'Properly works' do
      t=test_class.new
      t.instance_variable_set(:@foo,5)
      t.instance_variable_set(:@bar,10)
      expect(t.foo).to eq('5')
      expect(t.bar).to eq('10')
    end
    
  end
  
end
