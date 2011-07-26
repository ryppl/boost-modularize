# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(QuickBook TOOL
  AUTHORS
    "Joel de Guzman <joel -at- boost-consulting.com>"
    "Eric Niebler <eric -at- boost-consulting.com>"
  DESCRIPTION
    "A WikiWiki style documentation tool geared towards C++ documentation"
  DEPENDS
    filesystem
    program_options 
  )
