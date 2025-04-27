#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void analyze(const float *input, float *sum, int numElements) {
    // Calculate global thread index for the flattened grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop through all elements handled by this thread
    for (int idx = i; idx < numElements; idx += blockDim.x * gridDim.x) {
        atomicAdd(sum + idx, input[idx]);
    }
}