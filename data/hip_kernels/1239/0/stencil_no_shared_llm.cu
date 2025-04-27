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

__global__ void stencil_no_shared(int *in, int *out)
{
    int gindex = threadIdx.x + blockIdx.x * blockDim.x;
    int result = 0;

    // Loop unrolling for efficiency
    for (int offset = -RADIUS; offset <= RADIUS; offset += 2) {
        result += in[gindex + offset] + in[gindex + offset + 1];
    }
    
    // Store the result
    out[gindex] = result;
}