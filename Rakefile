require 'zip'
require 'fileutils'

current_dir = "#{File.expand_path(File.dirname(__FILE__))}/"
canonical_name = 'vamp-dashboard'
version = '0.1.0'
package_name = "#{canonical_name}-#{version}"


task :default => [:create_zip]
task :create_zip =>[:cleanup] do

  Dir.mkdir("#{current_dir}target") unless Dir.exist?("#{current_dir}target")
  zipfile_name = "#{current_dir}/target/#{package_name}.zip"
  Dir.chdir("#{current_dir}")
  files = Dir.glob("*.{rb,json}")

  Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
    Dir[File.join(current_dir, 'includes/**')].each do |file|
      zipfile.add(file.sub(current_dir, ''), file)
    end
    files.each do |filename|
      zipfile.add(filename, current_dir + "/" + filename)
    end
  end
end


task :cleanup do
  FileUtils.rmtree("#{current_dir}target")
end
