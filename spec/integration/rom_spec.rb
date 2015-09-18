require "rom"
require "rom/memory"

describe "ROM integration" do
  before do
    class UserMapper < Faceter::Mapper
      group :email, to: :emails

      list do
        field :emails do
          list { unfold from: :email }
        end
      end
    end

    # Set ROM environment
    ROM.use :auto_registration
    setup = ROM.setup :memory
    setup.relation(:users)

    setup.mappers do
      register(:users, mapped: UserMapper.new)
    end

    users = setup.default.dataset(:users)
    users.insert(id: 1, name: "Joe", email: "joe@doe.com")
    users.insert(id: 1, name: "Joe", email: "joe@doe.org")

    ROM.finalize
  end

  let(:rom)   { ROM.env }
  let(:users) { rom.relation(:users) }

  it "works" do
    expect(users.as(:mapped).to_a)
      .to eql [{ id: 1, name: "Joe", emails: ["joe@doe.com", "joe@doe.org"] }]
  end

  after { Object.send :remove_const, :UserMapper }
end # describe "ROM integration"
