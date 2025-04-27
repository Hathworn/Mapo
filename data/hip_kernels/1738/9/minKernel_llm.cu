```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void minKernel(float *array, int size, float* min)
{
    extern __shared__ float sdata[];
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * 2 * blockDim.x + threadIdx.x;
    int stride = blockDim.x * 2 * gridDim.x;

    // Load initial elements into shared memory; handling boundary condition
    if (i < size) {
        sdata[tid] = fminf(array[i], (i + blockDim.x < size) ? array[i + blockDim.x] : array[i]);
    } else {
        sdata[tid] = FLT_MAX; // Use FLT_MAX as a neutral minimum for unused threads
    }
    __syncthreads();

    // Reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] = fminf(sdata[tid], sdata[tid + s]);
        }
        __syncthreads();
    }

    // Write the result for this block to global memory
    if (tid == 0) {
        min[blockIdx.x] = sdata[0];
    }
}