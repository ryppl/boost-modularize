# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8)

find_package(Boost
  COMPONENTS
    algorithm
    array
    bind
    concept_check
    config
    conversion
    core
    detail
    exception
    format
    function
    fusion
    integer
    mpl
    numeric
    random
    regex
    smart_ptr
    spirit
    static_assert
    test
    timer
    tr1
    tuple
    type_traits
    utility
  NO_MODULE
  )
include("${Boost_DEV_FILE}")

boost_project(Math
  DEPENDS
    format
    array
  )

file(GLOB_RECURSE headers include/boost/*.?pp)
boost_add_headers(${headers} PREFIX "!include!!")

include_directories(src/tr1)

set(C99_SOURCES
  acosh
  asinh
  atanh
  cbrt
  copysign
  erfc
  erf
  expm1
  fmax
  fmin
  fpclassify
  hypot
  lgamma
  llround
  log1p
  lround
  nextafter
  nexttoward
  round
  tgamma
  trunc
  )

set(TR1_SOURCES
  assoc_laguerre
  assoc_legendre
  beta
  comp_ellint_1
  comp_ellint_2
  comp_ellint_3
  cyl_bessel_i
  cyl_bessel_j
  cyl_bessel_k
  cyl_neumann
  ellint_1
  ellint_2
  ellint_3
  expint
  hermite
  laguerre
  legendre
  riemann_zeta
  sph_bessel
  sph_legendre
  sph_neumann
  )

function(add_math_library name suffix)
  set(sources)
  foreach(src ${ARGN})
    list(APPEND sources "src/tr1/${src}${suffix}.cpp")
  endforeach(src)
  boost_add_library(math_${name}
    PRECOMPILE <boost/math/special_functions.hpp>
    SOURCES ${sources}
    )
endfunction(add_math_library)

add_math_library(tr1  ""  ${TR1_SOURCES})
add_math_library(tr1f "f" ${TR1_SOURCES})
add_math_library(tr1l "l" ${TR1_SOURCES})
add_math_library(c99  ""  ${C99_SOURCES})
add_math_library(c99f "f" ${C99_SOURCES})
add_math_library(c99l "l" ${C99_SOURCES})
