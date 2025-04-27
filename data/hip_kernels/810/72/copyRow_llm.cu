#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyRow(float *out, float *in, const int nx, const int ny)
{
    // Calculate thread's global row and column indices
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Use shared memory to optimize memory access
    __shared__ float tile[32][32]; // Assuming blockDim.x and blockDim.y are both 32

    if (ix < nx && iy < ny)
    {
        // Read from global memory into shared memory
        tile[threadIdx.y][threadIdx.x] = in[iy * nx + ix];
        __syncthreads();

        // Write back to global memory from shared memory
        out[iy * nx + ix] = tile[threadIdx.y][threadIdx.x];
    }
}