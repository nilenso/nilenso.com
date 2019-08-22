task default: "build"

task :build do
  status = system("middleman build --clean")
  puts status ? "OK" : "FAILED"
end
