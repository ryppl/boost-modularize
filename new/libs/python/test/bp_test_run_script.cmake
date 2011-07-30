# Copyright (C) 2011 Ravikiran Rajagopal <lists_ravi@lavabit.com>
# Copyright (C) 2011 Daniel Pfeifer <daniel@pfeifer-mail.de>
# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

set( ENV{PYTHONPATH} "${PYWD}" )

execute_process(COMMAND python "${PYSCRIPT}"
  WORKING_DIRECTORY "${PYWD}"
  RESULT_VARIABLE result
  ERROR_VARIABLE error
  ERROR_STRIP_TRAILING_WHITESPACE
  )

if((FAIL AND result EQUAL 0) OR (NOT FAIL AND NOT result EQUAL 0))
  message(FATAL_ERROR "${error}")
endif()
