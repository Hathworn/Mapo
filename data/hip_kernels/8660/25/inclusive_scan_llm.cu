#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized inclusive_scan kernel function
__global__ void inclusive_scan(const unsigned int *input, unsigned int *result)
{
    extern __shared__ unsigned int sdata[];

    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load input into shared memory
    sdata[threadIdx.x] = input[i];
    __syncthreads();

    // Hillis-Steele scan pattern
    for (int offset = 1; offset < blockDim.x; offset <<= 1)
    {
        unsigned int temp = 0;
        if(threadIdx.x >= offset)
        {
            temp = sdata[threadIdx.x - offset];
        }
        __syncthreads();

        // Sum two elements conditionally
        sdata[threadIdx.x] += temp;
        __syncthreads();
    }

    // Write results back
    result[i] = sdata[threadIdx.x];
}