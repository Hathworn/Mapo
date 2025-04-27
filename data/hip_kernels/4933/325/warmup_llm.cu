#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void warmup(int *in, int *out, const int nx, const int ny)
{
    // Calculate thread id using block and thread indices
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Check if the thread is within matrix bounds
    if (ix < nx && iy < ny)
    {
        // Optimize matrix indexing using pre-calculated index
        unsigned int in_idx = iy + ix * ny;
        unsigned int out_idx = ix + iy * nx;
        out[out_idx] = in[in_idx];
    }
}