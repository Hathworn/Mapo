#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeUnroll4Row(float *out, float *in, const int nx, const int ny)
{
    // Calculate initial x and y indices
    unsigned int ix = blockDim.x * blockIdx.x * 4 + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Calculate linear memory indices
    unsigned int ti = iy * nx + ix; 
    unsigned int to = ix * ny + iy; 

    // Ensure within bounds
    if (ix + 3 * blockDim.x < nx && iy < ny)
    {
        // Perform optimized memory transactions
        #pragma unroll // Unroll loop for efficiency
        for (int i = 0; i < 4; ++i) {
            out[to + i * ny * blockDim.x] = in[ti + i * blockDim.x];
        }
    }
}