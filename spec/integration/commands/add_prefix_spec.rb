# encoding: utf-8

describe "add_prefix" do

  subject { mapper.new.call input }

  let(:input) do
    [
      {
        "id" => 1, "name" => "joe",
        "contacts" => [{ "email" => "joe@example.com" }]
 }
    ]
  end

  let(:output) do
    [
      {
        "id" => 1, "user-name" => "joe",
        "user-contacts" => [{ "user-email" => "joe@example.com" }]
 }
    ]
  end

  let(:mapper) do
    Class.new(Faceter::Mapper) do
      list do
        add_prefix "user", separator: "-", except: "id", nested: true
      end
    end
  end

  it "works" do
    expect(subject).to eql output
  end

end # describe add_prefix
