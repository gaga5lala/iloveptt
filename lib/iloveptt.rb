require "iloveptt/version"
require 'fileutils'
require 'mechanize'

module Iloveptt
  def self.download(url)
    page_uri = URI.parse(url)

    # TODO: valid url
    # http://rubular.com/
    # raise ArgumentError.new("Unrecognized URL: #{url}")

    agent = Mechanize.new

    page = agent.get(page_uri)

    title = page.title.split(" - ")[0]
    post_id = page.uri.path.split("/").last.gsub('.html', '')

    puts "Parsing #{title}"

    # TODO: check file extension via regex
    image_urls = page.links.map(&:to_s).select{ |url| %(jpg png).include? url.split('.').last }

    target_folder_path = File.expand_path("~/Pictures/iloveptt/#{post_id} - #{title}")

    FileUtils.mkdir_p(target_folder_path) unless Dir.exists?(target_folder_path)

    image_urls.each do |image_url|
      image = agent.get(image_url)

      filename = File.expand_path(File.basename(image.uri.path), target_folder_path)
      File.delete(filename) if File.exists?(filename)
      image.save(filename)
    end

    puts "Done!"
  end
end
