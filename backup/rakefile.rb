#require 'albacore'
require 'spec/rake/spectask'

task :default => [:rspec]

#desc "Compile the solution using MSBuild."
#msbuild :msbuild do |msb|
#  msb.path_to_command = 'c:/Windows/Microsoft.NET/Framework/v3.5/MSBuild.exe'
#  msb.properties = {:configuration => :Debug}
#  msb.targets [:clean, :build]
#  msb.solution = File.join('CodeCampServer.sln')
#end

#desc "Publish the website."
#msbuild :publish => [] do |msb|
#	msb.properties = {:configuration => :debug}
#	msb.targets [:ResolveReferences, :_CopyWebApplication]
#	msb.properties = {
#		:webprojectoutputdir => "c:/temp/CodeCampServer/",
#		:outdir => "c:/temp/CodeCampServer/bin/"    
#	}
#	msb.solution = "src/Ccs.Site/Ccs.Site.csproj"
#end

Spec::Rake::SpecTask.new('rspec') do |t|
  t.spec_files = FileList['specs/**/*_spec.rb']
  #t.spec_opts = ["--format", "html:doc/reports/tools/failing_specs.html", "--diff"]
  #t.fail_on_error = false
end
