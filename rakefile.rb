require 'albacore'

task :default => [:msbuild]

desc "Compile the solution using MSBuild."
msbuild :msbuild do |msb|
  msb.path_to_command = 'c:/Windows/Microsoft.NET/Framework/v3.5/MSBuild.exe'
  msb.properties = {:configuration => :Debug}
  msb.targets [:clean, :build]
  msb.solution = File.join('CodeCampServer.sln')
end

desc "Publish the website."
msbuild :publish => [] do |msb|
	msb.properties = {:configuration => :debug}
	msb.targets [:ResolveReferences, :_CopyWebApplication]
	msb.properties = {
		:webprojectoutputdir => "c:/temp/CodeCampServer/",
		:outdir => "c:/temp/CodeCampServer/bin/"    
	}
	msb.solution = "src/Ccs.Site/Ccs.Site.csproj"
end

