#include "hip/hip_runtime.h"
#include "includes.h"

#pragma diag_suppress 177

#ifndef NAN
#define NAN (0.0/0.0)
#endif

#define ACCU_ARRTYPE double
#define IMUL(a, b) __mul24(a, b)

#ifndef CUIMAGE_REDUCE_THREADS
#define CUIMAGE_REDUCE_THREADS 512
#endif

#define NBLOCKS(N,blockSize) (N/blockSize+(N%blockSize==0?0:1))
#define NBLOCKSL(N,blockSize) 1

__global__ void arr_times_const_checkerboard(float* a, float b, float* c, size_t N, size_t sx, size_t sy, size_t sz) {
    size_t ids = blockIdx.x * blockDim.x + threadIdx.x; // Flattened thread index
    if (ids >= N) return;  // Boundary check

    // Efficiently calculate px and py using integer division
    size_t px = (ids / 2) % sx;
    size_t py = (ids / (2 * sx)) % sy; // Correcting the calculation of py
    float minus1 = 1 - 2 * ((px + py) % 2);
    c[ids] = a[ids] * b * minus1;
}