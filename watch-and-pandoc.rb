require 'filewatcher'
require 'pathname'
require 'slop'

# Process command line arguments
begin
  opts = Slop.parse do |o|
    o.string '-w', '--watch', 'watch directory, see github.com/filewatcher/filewatcher', required: true
    o.string '-o', '--output', 'output directory', default: './'
    o.on '-h', '--help', 'print help' do
      puts o
      exit
    end
    o.on '-v', '--version', 'print version' do
      puts '0.1.0'
      exit
    end
  end
rescue Slop::Error => ex
  puts ex
  exit
end

# Verify arguments
unless Dir.exist?(opts[:watch])
  puts "watch directory #{opts[:watch]} does not exist"
  exit
end

unless Dir.exist?(opts[:output])
  puts "output directory #{opts[:output]} does not exist"
  exit
end

# Start watching directory
Filewatcher.new(opts[:watch]).watch do |filename, event|
  # Watch for modified files
  #puts filename, event
  if (event == :updated) || (event == :created)
    puts filename
  end
end