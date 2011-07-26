# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

boost_module(BoostBook TOOL
  AUTHORS
    "Douglas Gregor <doug.gregor -at- gmail.com>"
  DESCRIPTION
    "The BoostBook documentation format is an extension of DocBook,"
    "an SGML- or XML-based format for describing documentation."
  DEB_DEPENDS
    docbook-xml
    docbook-xsl
  )
