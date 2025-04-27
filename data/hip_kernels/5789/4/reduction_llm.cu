#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction(int* input, int* output) {
    __shared__ int tmp[TPB];
    
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    tmp[threadIdx.x] = input[idx]; // Load input elements into shared memory
    
    __syncthreads();
    
    // Reduce in shared memory
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            tmp[threadIdx.x] += tmp[threadIdx.x + s];
        }
        __syncthreads(); // Synchronize to make sure all additions are done
    }
    
    // Write result for this block to output array
    if (threadIdx.x == 0) {
        output[blockIdx.x] = tmp[0];
    }
}