# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.8)
project(BoostSpirit NONE)

include(Ryppl)

ryppl_export(
  DEPENDS
    BoostAlgorithm
    BoostArray
    BoostCallTraits
    BoostConceptCheck
    BoostConfig
    BoostConversion
    BoostCore
    BoostException
    BoostForeach
    BoostFunction
    BoostFunctionTypes
    BoostFusion
    BoostIO
    BoostIOStreams
    BoostInteger
    BoostIterator
    BoostMPL
    BoostMath
    BoostOperators
    BoostOptional
    BoostPhoenix
    BoostPool
    BoostPreprocessor
    BoostProto
    BoostRange
    BoostRegex
    BoostSmartPtr
    BoostSpiritClassic
    BoostStaticAssert
    BoostTypeTraits
    BoostTypeof
    BoostUnordered
    BoostUtility
    BoostVariant
  RECOMMENDS
    BoostSerialization
  INCLUDE_DIRECTORIES
    include
  )
