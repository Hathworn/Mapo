#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduction(int* input, int* output) {
    __shared__ int tmp[TPB];

    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    tmp[threadIdx.x] = input[idx];

    __syncthreads();

    // Perform reduction in a loop to handle arbitrary block sizes
    for(int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if(threadIdx.x < stride) {
            tmp[threadIdx.x] += tmp[threadIdx.x + stride];
        }
        __syncthreads();
    }

    if(threadIdx.x == 0) {
        output[blockIdx.x] = tmp[0];
    }
}