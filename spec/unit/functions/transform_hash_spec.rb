# encoding: utf-8

describe Faceter::Functions, ".transform_hash" do

  let(:transformer) { proc { |hash| hash.reject { |key, _| key == :foo } } }

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:transform_hash, false, transformer] }

    let(:input)  { :foo }
    let(:output) { :foo }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:transform_hash, false, transformer] }

    let(:input)  { { bar: [{ baz: :BAZ, foo: :FOO }], foo: :FOO } }
    let(:output) { { bar: [{ baz: :BAZ, foo: :FOO }] }            }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:transform_hash, true, transformer] }

    let(:input)  { { bar: [{ baz: :BAZ, foo: :FOO }], foo: :FOO } }
    let(:output) { { bar: [{ baz: :BAZ }] }                       }
  end

end # describe Faceter::Functions.transform_hash
