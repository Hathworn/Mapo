#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSigmoid_d(const int nThreads, const float *input, float *output) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (i < nThreads) { // Check bounds within the kernel
        output[i] = input[i] * (1 - input[i]);
    }
}