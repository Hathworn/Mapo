#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef _WIN32
#  define WINDOWS_LEAN_AND_MEAN
#  define NOMINMAX
#  include <windows.h>
#endif

#if defined (__APPLE__) || defined(MACOSX)
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#ifndef glutCloseFunc
#define glutCloseFunc glutWMCloseFunc
#endif
#else
#endif

__global__ void SyncCells(int * __restrict__ i_cells, const int * __restrict__ o_cells, int size)
{
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Avoid checking out of bounds every time by using a grid-stride loop
    for (; idx < size; idx += blockDim.x * gridDim.x) {
        i_cells[idx] = o_cells[idx];
    }
}