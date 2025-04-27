#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void inclusive_scan(const unsigned int *X, unsigned int *Y, int N)
{
    extern __shared__ unsigned int XY[];

    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load input into shared memory
    if (i < N)
    {
        XY[threadIdx.x] = X[i];
    }
    __syncthreads();

    // Perform inclusive scan within block - optimized for shared memory access
    for (unsigned int stride = 1; stride < blockDim.x; stride *= 2) 
    {
        if (threadIdx.x >= stride)
        {
            XY[threadIdx.x] += XY[threadIdx.x - stride];
        }
        __syncthreads();
    }

    // Write result to global memory
    if (i < N)
    {
        Y[i] = XY[threadIdx.x];
    }
    __syncthreads();

    // Accumulate results from previous blocks - optimized for memory access
    if (blockIdx.x > 0 && threadIdx.x == 0)
    {
        unsigned int prevBlockSum = XY[blockDim.x - 1];
        for (int stride = 0; stride < blockIdx.x; stride++)
        {
            XY[threadIdx.x] += Y[stride * blockDim.x + blockDim.x - 1];
        }
        __syncthreads();

        // Update block results with accumulated prefix sum
        if (i < N)
        {
            Y[i] += prevBlockSum;
        }
    }
}