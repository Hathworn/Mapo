#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sum(const float *input, float *output, int numElements) {
    // Use shared memory to improve memory access speed
    extern __shared__ float sharedMem[];
    int tid = threadIdx.x;
    int index = tid + blockIdx.x * blockDim.x;
    float val = 0.0f;

    // Accumulate partial sums in each block
    for (int i = index; i < numElements; i += blockDim.x * gridDim.x) {
        val += input[i];
    }
    sharedMem[tid] = val;
    __syncthreads();

    // Reduce within the block
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (tid < stride) {
            sharedMem[tid] += sharedMem[tid + stride];
        }
        __syncthreads();
    }

    // Write block result to output
    if (tid == 0) {
        atomicAdd(output, sharedMem[0]);
    }
}