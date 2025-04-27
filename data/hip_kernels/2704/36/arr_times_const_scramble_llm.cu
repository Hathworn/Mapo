#include "hip/hip_runtime.h"
#include "includes.h"

// To suppress the unused variable argument for ARM targets
#pragma diag_suppress 177

#ifndef NAN   // should be part of math.h
#define NAN (0.0/0.0)
#endif

#define ACCU_ARRTYPE double  // Type of the temporary arrays for reduce operations
#define IMUL(a, b) __mul24(a, b)

#ifndef CUIMAGE_REDUCE_THREADS
#define CUIMAGE_REDUCE_THREADS 512
#endif

#define NBLOCKS(N, blockSize) (N/blockSize+(N%blockSize==0?0:1))
#define NBLOCKSL(N, blockSize) 1

__global__ void arr_times_const_scramble(float* a, float b, float* c, size_t sx, size_t sy, size_t sz, size_t ox, size_t oy, size_t oz)
{
    // Calculate the global position for each thread
    size_t pnum = (blockDim.x * blockIdx.x + threadIdx.x) + (blockDim.x * gridDim.x * blockIdx.y);
    
    // Calculate positions in the array
    size_t px = pnum % (sx / 2);
    size_t py = pnum / (sx / 2);

    // Check if within bounds
    if (px >= (sx / 2) || py >= (sy / 2)) return;

    // Calculate indices for source and destination arrays
    size_t ids = 2 * (px + py * sx);
    size_t idd = 2 * ((ox + px) + (oy + py) * sx);

    // Perform element swap using temporary variables
    float tmpR = c[idd];
    float tmpI = c[idd + 1];
    c[idd] = a[ids];
    c[idd + 1] = a[ids + 1];
    a[ids] = tmpR;
    a[ids + 1] = tmpI;
}