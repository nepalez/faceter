require "json"
require "rom"
require "benchmark/ips"

# Load data from ~4800 records
path = File.expand_path "../data.json", __FILE__
data = JSON.load(File.read(path))

puts <<-HEADER
================================================================================
Comparison of ROM mapper (inside ROM environment) and a standalone Faceter's one
Both mappers provide the same result with 2 levels of grouping and 2 wrappings
================================================================================
Tested under MRI #{RUBY_VERSION}
       with #{data.count} records from
       http://catalog.data.gov/dataset/hospital-general-information

HEADER

# Prepare Faceter standalone mapper
require_relative "./faceter.rb" # Load Faceter mapper definition
faceter_mapper = FaceterHospitals.new

# Initialize ROM
setup = ROM.setup(:memory)

# Populate the dataset with ~4800 records
dataset = setup.default.dataset(:hospitals)
data.each(&dataset.method(:insert))

# Define a relation
setup.relation(:hospitals)

# Register ROM mapper
require_relative "./rom.rb" # load ROM mapper definition
# setup.mappers { register :hospitals, faceter_mapper }

# Finalize ROM
rom = ROM.finalize.env

# Provide a benchmark
Benchmark.ips do |x|
  x.config time: 20, warmup: 5

  x.report("ROM mapper") do
    rom.relation(:hospitals).as(:rom).to_a
  end

  x.report("Faceter (standalone)") do
    faceter_mapper.call(data)
  end

  x.compare!
end
