require 'rake/packagetask'
require 'fileutils'

task :default => [:package, :cleanup]

Rake::PackageTask.new("vamp-dashboard", "0.1.0") do |p|
  p.need_zip = true
  p.package_files.include("*.rb")
  p.package_files.include("web/**/*")
  p.package_files.include("lib/*")
end

task :cleanup do

  Dir.chdir("pkg")
  FileUtils.rm_rf("vamp-dashboard-0.1.0")

end
