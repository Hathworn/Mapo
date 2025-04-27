#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSign(float* gData, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Optimize by using a single if-else statement to reduce branching
    if (idx < numElements) {
        int sign = 0;
        if (gData[idx] > 0) sign = 1;
        else if (gData[idx] < 0) sign = -1;
        target[idx] = sign;
    }
}