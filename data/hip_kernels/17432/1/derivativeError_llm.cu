#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 32

__global__ void derivativeError(float *output, float *actual, float *deriv_err)
{
    __shared__ float sdata[BLOCK_SIZE]; // Adjust shared memory size for better usage

    // Calculate global index correctly for a 1D block configuration
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y;

    // Load data into shared memory
    sdata[threadIdx.x] = output[row * gridDim.y + col];
    __syncthreads();

    // Perform parallel reduction in shared memory
    for (int s = BLOCK_SIZE / 2; s > 0; s >>= 1)
    {
        if (threadIdx.x < s)
            sdata[threadIdx.x] += sdata[threadIdx.x + s];
        __syncthreads();
    }

    // Write result for this block to global memory
    if (threadIdx.x == 0)
    {
        deriv_err[blockDim.y * blockIdx.x + col] = sdata[0];
    }
}