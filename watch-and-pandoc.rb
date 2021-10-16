require 'filewatcher'
require 'slop'

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

puts opts.to_hash