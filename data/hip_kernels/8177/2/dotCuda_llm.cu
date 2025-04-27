#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void dotCuda(float* tmp, float* t1, float* t2, int size) {
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;

    // Calculate partial dot product
    for (int idx = i; idx < size; idx += stride) {
        tmp[idx] = t1[idx] * t2[idx];
    }
    __syncthreads();

    // Reduce step: Use shared memory to accumulate results
    extern __shared__ float sdata[];
    sdata[threadIdx.x] = (i < size) ? tmp[i] : 0;
    __syncthreads();

    // Reduce within block
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            sdata[threadIdx.x] += sdata[threadIdx.x + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (threadIdx.x == 0) {
        tmp[blockIdx.x] = sdata[0];
    }
}
