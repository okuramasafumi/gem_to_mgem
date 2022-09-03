require 'pathname'
require 'fileutils'
require_relative "gem_to_mgem/version"

module GemToMgem
  class Error < StandardError; end

  def self.run
    main_file = Dir.glob('lib/*.rb')[0]
    main_contents = readlines_with_require_resolution(main_file).join
    FileUtils.mkdir_p 'mgem'
    File.write("mgem/#{Pathname.new(main_file).basename}", main_contents)

    test_files = Dir.glob('test/**/*_test.rb')
    test_helper_content = readlines_with_require_resolution('test/test_helper.rb').join
    test_contents = compile(test_files)
    FileUtils.mkdir_p 'mgem/test'
    File.write('mgem/test/test.rb', test_helper_content.concat(test_contents))
  end

  def self.readlines_with_require_resolution(filename)
    pathname = Pathname.new(filename)
    dirname = pathname.dirname
    lines = File.readlines(filename)
    requires, non_requires = lines.partition do |line|
      line.strip.start_with?('require') || line.strip.start_with?('require_relative')
    end
    require_lines = requires.filter_map do |line|
      if line.strip.start_with?('require_relative')
        matchdata = line.match(/require_relative[ \(]['"](.+)['"]\)?/)
        if matchdata
          required_file = matchdata[1]
          readlines_with_require_resolution("#{dirname}/#{required_file}.rb")
        else
          line
        end
      elsif line.strip.start_with?('require')
        nil # mruy does not support require
      else
        line
      end
    end
    require_lines + non_requires
  end

  def self.compile(file_names)
    file_names.each_with_object('') do |filename, str|
      str << convert_minitest_to_mruby_test(filename)
      str << "\n"
    end
  end

  def self.convert_minitest_to_mruby_test(filename)
    content = File.read(filename)
    content.gsub!(/Mini(t|T)est::Test/, 'MTest::Unit::TestCase')
    content
  end
end
