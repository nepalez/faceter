require "rom"
require "rom/memory"

describe "ROM integration" do

  let(:setup) { ROM.setup :memory }
  let(:rom)   { ROM.finalize.env  }

  before do
    class UserMapper < Faceter::Mapper
      group :email, to: :emails

      list do
        field :emails do
          list { unfold from: :email }
        end
      end
    end

    setup.relation(:users)

    setup.mappers do
      register(:users, mapped: UserMapper.new)
    end

    users = setup.default.dataset(:users)
    users.insert(id: 1, name: "Joe", email: "joe@doe.com")
    users.insert(id: 1, name: "Joe", email: "joe@doe.org")
  end

  it "works" do
    expect(rom.relation(:users).as(:mapped).to_a).to eql [
      { id: 1, name: "Joe", emails: ["joe@doe.com", "joe@doe.org"] }
    ]
  end

  after { Object.send :remove_const, :UserMapper }

end # describe "ROM integration"
