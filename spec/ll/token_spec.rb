require 'spec_helper'

describe LL::Token do
  context '#==' do
    before do
      @line  = source_line('foo')
      @token = described_class.new(:T_IDENT, 'foo', @line)
    end

    it 'returns false when comparing a Token with a Fixnum' do
      @token.should_not == 10
    end

    it 'returns false if two Token types do not match' do
      @token.should_not == described_class.new(:T_FOO, 'foo', @line)
    end

    it 'returns false if two Token values do not match' do
      @token.should_not == described_class.new(:T_IDENT, 'bar', @line)
    end

    it 'returns false if two Token source lines do not match' do
      @token.should_not == described_class.new(:T_IDENT, 'foo', source_line('x'))
    end

    it 'returns true if two Token instances are equal' do
      @token.should == described_class.new(:T_IDENT, 'foo', @line)
    end
  end
end
