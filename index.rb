require 'sqlite3'
require 'digest'
require 'yaml'

#=========== Initialize Vars ===========#
sha_sums = Hash.new
root = Dir.pwd # get current directory
up_file_list = Dir.entries("uploads") # get files list of "uploads"

#============ Methods/Main =============#
def mk_sha2(f)
    Digest::SHA512.file f
end

# check for duplicates
up_file_list.each do |f|
    s = mk_sha2(f)
    if sha_sums.key?(s.to_s)
        puts "discovered duplicate, file #{f} is identical to #{sha_sums[s]}"
    else
        sha_sums[s.to_s] = f
    end
end

puts "scan of 'uploads' complete."


