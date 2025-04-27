#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyRow(float *out, float *in, const int nx, const int ny)
{
    // Calculate global thread index
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Use shared memory to temporarily store the row data
    extern __shared__ float sharedRow[];
    unsigned int threadIdxFlat = threadIdx.y * blockDim.x + threadIdx.x;
    
    if (ix < nx && iy < ny)
    {
        // Load data into shared memory
        sharedRow[threadIdxFlat] = in[iy * nx + ix];
        __syncthreads();
        
        // Copy from shared memory to global memory
        out[iy * nx + ix] = sharedRow[threadIdxFlat];
    }
}