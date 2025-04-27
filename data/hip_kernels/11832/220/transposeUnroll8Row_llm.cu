#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeUnroll8Row(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockDim.x * blockIdx.x * 8 + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Calculate initial indices
    unsigned int ti = iy * nx + ix; // access in rows
    unsigned int to = ix * ny + iy; // access in columns

    // Boundary check to ensure threads don't access out of bounds memory
    if (ix + 7 * blockDim.x < nx && iy < ny)
    {
        // Prefetch data to reduce repetitive global memory access
        float input[8];
        #pragma unroll
        for (int i = 0; i < 8; ++i) {
            input[i] = in[ti + i * blockDim.x];
        }

        // Transfer the prefetched data to the output
        #pragma unroll
        for (int i = 0; i < 8; ++i) {
            out[to + i * ny * blockDim.x] = input[i];
        }
    }
}