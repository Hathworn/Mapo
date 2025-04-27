#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLog(float* gData, float* target, unsigned int numElements) {
    // Calculate the global index for the thread
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop through elements by stride
    for (unsigned int i = idx; i < numElements; i += gridDim.x * blockDim.x) {
        target[i] = __logf(gData[i]); // Compute the log for each element
    }
}