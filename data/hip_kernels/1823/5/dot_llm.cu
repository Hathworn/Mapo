#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot(int *a, int *b, int *temp, int *c)
{
    // Calculate global thread index
    int outputIndex = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    int result = 0;

    // Compute partial sum across this block
    for (int i = outputIndex; i < N; i += stride)
    {
        result += a[i] * b[i];
    }

    // Store result to shared memory
    temp[outputIndex] = result;

    // Synchronize threads within block
    __syncthreads();

    // Reduction within block
    for (int i = blockDim.x / 2; i > 0; i >>= 1)
    {
        if (threadIdx.x < i)
        {
            temp[outputIndex] += temp[outputIndex + i];
        }
        __syncthreads();
    }

    // Write block result to global memory
    if (threadIdx.x == 0)
    {
        c[blockIdx.x] = temp[outputIndex];
    }
}