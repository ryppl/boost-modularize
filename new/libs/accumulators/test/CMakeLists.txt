# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

include(BoostTesting)

#if(MSVC)
#  add_definitions(-D_HAS_ITERATOR_DEBUGGING=0)
#endif(MSVC)

boost_test_suite(
  RUN
    count
    covariance
    droppable
    error_of
    extended_p_square
    extended_p_square_quantile
    external_accumulator
    external_weights
    kurtosis
    max
    mean
    median
    min
    moment
    pot_quantile
    p_square_cumulative_distribution
    p_square_quantile
    reference
    skewness
    sum
    tail
    tail_mean
    tail_quantile
    tail_variate_means
    valarray
    variance
    vector
    weighted_covariance
    weighted_extended_p_square
    weighted_kurtosis
    weighted_mean
    weighted_median
    weighted_moment
    weighted_p_square_cum_dist
    weighted_p_square_quantile
    weighted_skewness
    weighted_sum
    weighted_variance
    weighted_pot_quantile
    weighted_tail_mean
    weighted_tail_quantile
    weighted_tail_variate_means
  LINK_BOOST_LIBRARIES
    serialization
    unit_test_framework
  )
