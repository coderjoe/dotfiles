require 'rake'
require 'erb'
require 'open-uri'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE gnupg].include? file
   
    replace_all = check_file(file, replace_all)
  end

  gpgdir = "#{ENV['HOME']}/.gnupg"
  if Dir.exist? gpgdir
    Dir['gnupg/*.erb'].each do |file|
      replace_all = check_file(file, replace_all)
    end

    Dir["#{gpgdir}/**/*"].each do |file|
      set_gpg_permissions(file)
    end

    replace_all = check_sks_cert(gpgdir, replace_all)
  end
end

def set_gpg_permissions(file)
  File.chmod(0600, file) if File.file?(file)
  File.chmod(0700, file) if File.directory?(file)
end

def check_sks_cert(gpgdir, replace_all)
  sks_cert_uri = "https://sks-keyservers.net/sks-keyservers.netCA.pem"
  cert_directory = "#{gpgdir}/keyserver-certs"
  cert_file = "#{cert_directory}/sks-keyservers.netCA.pem"

  system 'mkdir', '-p', cert_directory
  File.chmod(0700, cert_directory)

  puts "Downloading #{sks_cert_uri}..."
  if File.exist?(cert_file)
    print "overwrite #{cert_file}? [ynaq] "
    case $stdin.gets.chomp
    when 'a'
      replace_all = true
      download_file(sks_cert_uri, cert_file)
    when 'y'
      download_file(sks_cert_uri, cert_file)
    when 'q'
      exit
    else
      puts "skipping #{cert_file}"
    end
  else
    download_file(sks_cert_uri, cert_file)
  end

  File.chmod(0600, cert_file)

  replace_all
end

def download_file(uri, file)
  open(file, 'wb') do |file|
    file << open(uri).read
  end
end

def check_file(file, replace_all)
  if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
    if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
      puts "identical ~/.#{file.sub('.erb', '')}"
    elsif replace_all
      replace_file(file)
    else
      print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
      case $stdin.gets.chomp
      when 'a'
        replace_all = true
        replace_file(file)
      when 'y'
        replace_file(file)
      when 'q'
        exit
      else
        puts "skipping ~/.#{file.sub('.erb', '')}"
      end
    end
  else
    link_file(file)
  end

  replace_all
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end
