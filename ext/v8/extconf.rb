require 'mkmf'
require 'set'

have_library('objc') if RUBY_PLATFORM =~ /darwin/

$CPPFLAGS += " -Wall" unless $CPPFLAGS.split.include? "-Wall"
$CPPFLAGS += " -g" unless $CPPFLAGS.split.include? "-g"
$CPPFLAGS += " -rdynamic" unless $CPPFLAGS.split.include? "-rdynamic"

$LIBS << ' -lv8 -lpthread'

CONFIG['LDSHARED'] = '$(CXX) -shared' unless RUBY_PLATFORM =~ /darwin/

create_makefile('v8')
