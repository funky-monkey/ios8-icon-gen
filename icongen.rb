require 'rubygems'
require 'bundler/setup'
require 'rmagick'

class IconGen

  GEOMETRIES = [
      {type: 'iPad-29pt', x: 29, y: 29},
      {type: 'iPad-29pt@2x', x: 58, y: 58},
      {type: 'iPhone-29pt@2x', x: 58, y: 58},
      {type: 'iPhone-29pt@3x', x: 87, y: 87},
      {type: 'iPad-40pt', x: 40, y: 40},
      {type: 'iPad-40pt@2x', x: 80, y: 80},
      {type: 'iPhone-40pt@2x', x: 80, y: 80},
      {type: 'iPhone-40pt@3x', x: 120, y: 120},
      {type: 'iPad-76pt', x: 76, y: 76},
      {type: 'iPad-76pt@2x', x: 152, y: 152},
      {type: 'iPhone-60pt@2x', x: 120, y: 120},
      {type: 'iPhone-60pt@3x', x: 180, y: 180}
  ]

  def initialize(args)
    @args = args
  end

  def run
    @args.each { |f| handle f }
  end

  # Easily put the geometries in a gitignore
  def gitignore_shizzle
    GEOMETRIES.each do |g|
      puts "*#{g[:type]}.png"
    end
  end

  private
  def handle(file)
    image = magick_data_for(file)
    name = File.basename(file).gsub(File.extname(file), '')
    if image.format.eql?('PNG') # only allow PNG
      puts "WARNING! Image #{file} is not square, but #{image.rows}x#{image.columns}" unless image.columns == image.rows
      puts "WARNING! Image #{file} may be too small" if image.rows < max_for_geometries
      GEOMETRIES.each do |geom|
        puts "writing image for #{geom[:type]}"
        resized = image.resize(geom[:x], geom[:y])
        resized.write("#{name}-#{geom[:type]}.png")
      end
    end
  end

  def magick_data_for(image_path)
    Magick::Image::read(image_path).first
  end

  def max_for_geometries
    GEOMETRIES.each.map{|g|g[:x]}.max
  end
end

app = IconGen.new(ARGV)
app.run
# app.gitignore_shizzle
