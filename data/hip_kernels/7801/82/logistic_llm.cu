#include "hip/hip_runtime.h"
#include "includes.h"

// 1 / (1 + e^(-x))
extern "C" __global__ void logistic(size_t n, double *result, double *x)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for common operation
    __shared__ double shared_exp[256];  // Adjust size based on blockDim

    if (i < n)
    {
        shared_exp[threadIdx.x] = exp(-x[i]);
        __syncthreads();  // Ensure all threads have completed the above operation

        result[i] = 1.0 / (1.0 + shared_exp[threadIdx.x]);
    }
}