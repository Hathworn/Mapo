#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAssignScalar(float* dest, float alpha, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x; 
    if (idx < len) { // Check to ensure idx is within bounds
        dest[idx] = alpha;
    }
}