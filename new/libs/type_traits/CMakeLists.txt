# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    config
    detail
    mpl
    preprocessor
    static_assert
    typeof
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project("Type Traits"
  AUTHORS
    "David Abrahams <dave -at- boostpro.com>"
    "Steve Cleary" 
    "Beman Dawes <bdawes -at- acm.org>" 
    "Aleksey Gurtovoy <agurtovoy -at- meta-comm.com>" 
    "Howard Hinnant" 
    "Jesse Jones" 
    "Mat Marcus" 
    "Itay Maman" 
    "John Maddock <john -at- johnmaddock.co.uk>" 
    "Alexander Nasonov <alexander.nasonov -at- gmail.com>" 
    "Thorsten Ottosen <nesotto -at- cs.auc.dk>"
    "Robert Ramey <ramey -at- rrsd.com>" 
    "Jeremy Siek <jeremy.siek -at- gmail.com>"
  DESCRIPTION
    "Templates for fundamental properties of types."
  DEPENDS
    config
    static_assert
  )

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers(${headers} PREFIX "!include!!")

