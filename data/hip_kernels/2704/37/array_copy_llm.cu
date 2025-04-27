#include "hip/hip_runtime.h"
#include "includes.h"

// To suppress the unused variable argument for ARM targets
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

__global__ void array_copy(float* __restrict__ a, float* __restrict__ c, size_t mx, size_t my, size_t mz, size_t sx, size_t sy, size_t sz, size_t ox, size_t oy, size_t oz)
{
    size_t pnum = blockIdx.x * blockDim.x + threadIdx.x; // Optimized linear index computation
    size_t num_elements = (sx/2) * (sy/2); // Calculate total number of elements

    if (pnum >= num_elements) return; // Early exit for threads without work

    size_t px = pnum % (sx/2); // Compute x position
    size_t py = pnum / (sx/2); // Compute y position

    size_t ids = 2 * (px + py * sx); // Source index
    size_t idd = 2 * ((ox + px) + (oy + py) * sx); // Destination index

    // Efficient swap of elements using local variables
    float tmpR = c[idd];
    float tmpI = c[idd + 1];
    c[idd] = a[ids];
    c[idd + 1] = a[ids + 1];
    a[ids] = tmpR;
    a[ids + 1] = tmpI;
}