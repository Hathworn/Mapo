```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void analyze(const float *input, float *sum, int numElements) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure valid index and optimize memory access pattern
    if (i < numElements) {
        atomicAdd(&sum[blockIdx.x], input[i]);
    }
}