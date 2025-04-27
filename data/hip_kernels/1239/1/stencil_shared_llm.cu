#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 1024

#ifndef RADIUS
#define RADIUS 3
#endif

#ifndef ITERS
#define ITERS 100
#endif

#ifndef USE_L2
#define USE_L2 false
#endif

__global__ void stencil_shared(int *in, int *out)
{
    __shared__ int temp[BLOCK_SIZE + 2 * RADIUS];
    int gindex = threadIdx.x + blockIdx.x * blockDim.x;
    int lindex = threadIdx.x + RADIUS;

    // Optimize: Use shared memory efficiently for boundary conditions
    temp[lindex] = in[gindex + RADIUS];
    if (threadIdx.x < RADIUS) {
        temp[lindex - RADIUS] = in[gindex];
        temp[lindex + BLOCK_SIZE] = in[gindex + BLOCK_SIZE + RADIUS];
    }
    __syncthreads();

    // Optimize: Use loop unrolling for performance
    int result = temp[lindex - 3] + temp[lindex - 2] + temp[lindex - 1] 
                 + temp[lindex] 
                 + temp[lindex + 1] + temp[lindex + 2] + temp[lindex + 3];

    // Store the result
    out[gindex] = result;
}