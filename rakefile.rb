require 'json'
namespace :guides do
  task :create do
    file = File.read('sous-vide-data.json')
    data_hash = JSON.parse(file)
    data_hash.each_with_index do |guide, index|
      type = guide['type']
      food = guide['food']
      doneness = guide["desired doneness"]
      temp_c = guide["temperature(c)"]
      temp_f = guide["temperature(f)"]
      minimum = guide["minimum"]
      best = guide["best"]
      maximum = guide["maximum"]

      File.open("_guides/#{type}_#{food}_#{doneness}.md", 'w+') do |f|
        f.write("---\n")
        f.write("layout: guide\n")
        f.write("title: #{type} #{food} #{doneness}\n")
        f.write("type: #{type}\n")
        f.write("food: #{food}\n")
        f.write("doneness: #{doneness}\n")
        f.write("temp_c: #{temp_c}\n")
        f.write("temp_f: #{temp_f}\n")
        f.write("minimum: #{minimum}\n")
        f.write("best: #{best}\n")
        f.write("maximum: #{maximum}\n")
        f.write("---")
      end
    end
  end
end
