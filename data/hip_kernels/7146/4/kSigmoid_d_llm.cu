```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSigmoid_d(const int nThreads, float const *input, float *output) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride loop for better workload distribution
    int stride = blockDim.x * gridDim.x;

    // Loop over all elements using the calculated stride
    for (; i < nThreads; i += stride) {
        // Apply the sigmoid derivative function
        output[i] = input[i] * (1.0f - input[i]);
    }
}