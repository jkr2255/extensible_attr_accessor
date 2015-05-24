require 'spec_helper'

describe 'module#attr_accessor' do
  
  it 'is a private method' do
    expect {Class.attr_accessor}.to raise_error(NoMethodError)
  expect {Class.method(:attr_accessor)}.not_to raise_error
  end
  
  context 'without block' do
    let(:test_class) do
      Class.new do
        attr_accessor :foo, :bar
      end
    end
    
    it 'properly works on getter' do
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
        #completely for test only
        attr_accessor(:foo, :bar){ |val, mode| "#{val},#{mode}" }
      end
    end
    context 'getter' do
      
      it 'properly works' do
        t=test_class.new
        t.instance_variable_set(:@foo,'foo')
        t.instance_variable_set(:@bar,'bar')
        expect(t.foo).to eq('foo,get')
        expect(t.bar).to eq('bar,get')
      end
      
      
    end
    context 'setter' do
      
      it 'properly works' do
        t=test_class.new
        foo=t.foo='foo'
        bar=t.bar='bar'
        expect(t.instance_variable_get(:@foo)).to eq('foo,set')
        expect(t.instance_variable_get(:@bar)).to eq('bar,set')
        expect(foo).to eq('foo')
        expect(bar).to eq('bar')
        
     end
      
      
    end
    
  end
  
end
