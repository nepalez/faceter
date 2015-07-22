# encoding: utf-8

describe Faceter::Nodes::Base do

  let(:node) { described_class.new :foo, to: :bar, except: /foo/, only: /bar/ }

  describe ".new" do

    subject { node }

    it { is_expected.to be_kind_of AbstractMapper::Node }
    it { is_expected.to be_frozen }

  end # describe .new

  describe "#attributes" do

    subject { node.attributes }
    it { is_expected.to eql [:foo, to: :bar, except: /foo/, only: /bar/] }

  end # describe #attributes

  describe "#selector" do

    subject { node.selector }
    it { is_expected.to be_kind_of Selector::Condition }

    it "works properly" do
      expect(subject[:bar]).to eql true
      expect(subject[:foobar]).to eql false
      expect(subject[:baz]).to eql false
    end

  end # describe #selector

end # describe Faceter::Nodes::Base
