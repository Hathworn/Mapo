#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyRow_1(float * __restrict__ out, const float * __restrict__ in, const int nx, const int ny)
{
    // Calculate global thread ID
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Use shared memory for tiles (if applicable)
    extern __shared__ float tile[];
    unsigned int tid = threadIdx.y * blockDim.x + threadIdx.x;

    // Improve memory access pattern and coalescing
    if (ix < nx && iy < ny)
    {
        tile[tid] = in[iy * nx + ix];
        __syncthreads(); // Ensure all threads have written their data

        // Write back to global memory
        out[iy * nx + ix] = tile[tid];
    }
}