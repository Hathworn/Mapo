#include "hip/hip_runtime.h"
#include "includes.h"

/*
* Perform a reduction from data of length 'size' to result, where length of result will be 'number of blocks'.
*/
extern "C"
__global__ void mult(int n, float *a, float *b, float *result)
{
    // Use shared memory for partial results
    extern __shared__ float shared[];
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data into shared memory
    if (i < n)
        shared[threadIdx.x] = a[i] * b[i];
    else
        shared[threadIdx.x] = 0.0f; // Handle out-of-bounds

    __syncthreads(); // Ensure all threads have loaded data

    // Reduction within block
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (threadIdx.x < stride)
            shared[threadIdx.x] += shared[threadIdx.x + stride];
        __syncthreads(); // Sync after each reduction step
    }

    // Write result for this block to global memory
    if (threadIdx.x == 0)
        result[blockIdx.x] = shared[0];
}