```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK_X 16
#define THREADS_PER_BLOCK_Y 16

__device__ int translate_idx(int ii, int d1, int d2, int d3, int scale_factor)
{
    int x, y, z, w;
    w = ii % d3;
    ii = ii / d3;
    z = ii % d2;
    ii = ii / d2;
    y = ii % d1;
    ii = ii / d1;
    x = ii;
    w = w / scale_factor;
    z = z / scale_factor;
    d2 /= scale_factor;
    d3 /= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

__global__ void upscale(float *input, float *output, long no_elements, int scale_factor, int d1, int d2, int d3)
{
    // Optimized block offset calculation
    long ii = threadIdx.x + blockIdx.x * THREADS_PER_BLOCK_X;
    ii += (threadIdx.y + blockIdx.y * THREADS_PER_BLOCK_Y) * (THREADS_PER_BLOCK_X * gridDim.x);
    
    // Boundary check
    if (ii >= no_elements) return;
    
    // Calculate the input index
    int ipidx = translate_idx(ii, d1, d2, d3, scale_factor);
    
    // Upscale operation
    output[ii] = input[ipidx];
}
```
