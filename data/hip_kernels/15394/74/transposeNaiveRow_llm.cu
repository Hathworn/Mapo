#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeOptimizedRow(float *out, float *in, const int nx, const int ny)
{
    // Use shared memory to optimize global memory access
    __shared__ float tile[32][33]; // Avoid bank conflicts with padding
    
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;
    
    if (ix < nx && iy < ny)
    {
        // Load from global memory to shared memory
        tile[threadIdx.y][threadIdx.x] = in[iy * nx + ix];
    }
    __syncthreads();
    
    // Calculate transposed indices
    unsigned int transposed_ix = blockDim.y * blockIdx.y + threadIdx.x;
    unsigned int transposed_iy = blockDim.x * blockIdx.x + threadIdx.y;

    if (transposed_ix < ny && transposed_iy < nx)
    {
        // Write from shared memory to global memory
        out[transposed_iy * ny + transposed_ix] = tile[threadIdx.x][threadIdx.y];
    }
}