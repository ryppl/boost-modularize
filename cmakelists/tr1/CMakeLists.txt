# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.8)
project(BoostTR1 NONE)

include(Ryppl)

ryppl_export(
  DEPENDS
    BoostArray
    BoostBind
    BoostConfig
    BoostCore
    BoostFunction
    BoostFunctionalHash
    BoostFusion
    BoostIterator
    BoostMath
    BoostMPL
    BoostRandom
    BoostRegex
    BoostSmartPtr
    BoostStaticAssert
    BoostTuple
    BoostTypeTraits
    BoostUnordered
    BoostUtility
  INCLUDE_DIRECTORIES
    include
  )
