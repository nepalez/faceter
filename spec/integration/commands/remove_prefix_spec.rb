# encoding: utf-8

describe "remove_prefix" do

  subject { mapper.new.call input }

  let(:input) do
    [
      {
        user_id: 1,
        "user_name" => "joe",
        contacts: [
          {
            "contact.emails" => [
              {
                :"contact.address" => "joe@doe.com",
                "contact.type" => "job"
              }
            ],
            user_skype: "joe"
          }
        ]
      }
    ]
  end

  let(:output) do
    [
      {
        id: 1,
        "user_name" => "joe",
        contacts: [
          {
            "emails" => [
              {
                address: "joe@doe.com",
                "type" => "job"
              }
            ],
            user_skype: "joe"
          }
        ]
      }
    ]
  end

  let(:mapper) do
    Class.new(Faceter::Mapper) do
      list do
        remove_prefix "user", only: :user_id

        field :contacts do
          remove_prefix "contact", separator: ".", nested: true
        end
      end
    end
  end

  it "works" do
    expect(subject).to eql output
  end

end # describe remove_prefix
