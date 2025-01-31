#######################################
#
# Pine - gcc - openmpi - lapack/blas
#
# Uses :
#   - GCC	     gcc (cc, CC, ftn)
#   - OpenMPI       for MPI
#   - OpenBLAS      for BLAS and LAPACK
#
#######################################
#
# Requires modules :
#     . gcc                = 12.2
#   - cmake                = 3.27.9
#   - openmpi              = 4.1.6
#
# Load modules this way :
#   - module purge
#	module load gcc/12.2.0
#	module load openmpi-gcc/4.1.6
#	module load cmake/3.27.9
#	module load aocl/4.1.0-gcc
#	module load anaconda3/2024.02
#
########################################

set( CONFIG_NAME "pine-gcc12.2-openmpi4.1.6-blas" CACHE PATH "" )

include(${CMAKE_CURRENT_LIST_DIR}/pine-base.cmake)

#######################################
# COMPILER SETUP
#######################################

set( CMAKE_C_COMPILER       "gcc"  CACHE PATH "" )
set( CMAKE_CXX_COMPILER     "g++"  CACHE PATH "" )
set( CMAKE_Fortran_COMPILER "gfortran" CACHE PATH "" )

set( COMMON_FLAGS  "-march=native -mtune=native" )
set( RELEASE_FLAGS "-O3 -DNDEBUG"                )
set( DEBUG_FLAGS   "-O0 -g"                      )

set( CMAKE_C_FLAGS               ${COMMON_FLAGS}  CACHE STRING "" )
set( CMAKE_CXX_FLAGS             ${COMMON_FLAGS}  CACHE STRING "" )
set( CMAKE_Fortran_FLAGS         ${COMMON_FLAGS}  CACHE STRING "" )
set( CMAKE_CXX_FLAGS_RELEASE     ${RELEASE_FLAGS} CACHE STRING "" )
set( CMAKE_C_FLAGS_RELEASE       ${RELEASE_FLAGS} CACHE STRING "" )
set( CMAKE_Fortran_FLAGS_RELEASE ${RELEASE_FLAGS} CACHE STRING "" )
set( CMAKE_CXX_FLAGS_DEBUG       ${DEBUG_FLAGS}   CACHE STRING "" )
set( CMAKE_C_FLAGS_DEBUG         ${DEBUG_FLAGS}   CACHE STRING "" )
set( CMAKE_Fortran_FLAGS_DEBUG   ${DEBUG_FLAGS}   CACHE STRING "" )

#######################################
# MPI SETUP
#######################################

# use :
# - OpenMPI library

set( ENABLE_MPI ON CACHE BOOL "" )

#######################################                                                                                                                                           
# BLAS/LAPACK SETUP                                                                                                                                                               
#######################################

set(BLAS_LIBRARIES /usr/lib64/libopenblas.so.0)
set(LAPACK_LIBRARIES /usr/lib64/libopenblas.so.0)

include( ${CMAKE_CURRENT_LIST_DIR}/../tpls.cmake )

