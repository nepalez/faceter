# encoding: utf-8

module Faceter::Nodes # keyspace for constants

  describe Faceter::Rules::OrderFields do

    it_behaves_like :optimizing_nodes do
      let(:nodes) do
        [
          Field.new(key: :foo),
          Field.new(key: :bar),
          Field.new(key: :foo),
          Rename.new(keys: { foo: :bar }),
          Field.new(key: :foo)
        ]
      end

      let(:output) do
        [
          Field.new(key: :bar),
          Field.new(key: :foo),
          Field.new(key: :foo),
          Rename.new(keys: { foo: :bar }),
          Field.new(key: :foo)
        ]
      end
    end

  end # describe Faceter::Rules::OrderFields

end # module Faceter
