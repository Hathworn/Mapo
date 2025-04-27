#include "hip/hip_runtime.h"
#include "includes.h"

// Improved version of the reduction kernel

/*
* Perform a reduction from data of length 'size' to result, where length of result will be 'number of blocks'.
*/
extern "C"
__global__ void reducePartial(int size, void *data, void *result) {
    float *fdata = (float*) data;
    float *sum = (float*) result;

    extern __shared__ float sdata[];

    // Calculate thread and block indices
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x*(blockDim.x*2) + threadIdx.x;

    // Load data into shared memory and perform first level of reduction
    float mySum = (i < size ? fdata[i] : 0) + (i + blockDim.x < size ? fdata[i + blockDim.x] : 0);
    sdata[tid] = mySum;
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) sum[blockIdx.x] = sdata[0];
}