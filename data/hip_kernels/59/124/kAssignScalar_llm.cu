#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAssignScalar(float* dest, float alpha, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a simplified range check with stride loop
    if (idx < len) {
        for (unsigned int i = idx; i < len; i += gridDim.x * blockDim.x) {
            dest[i] = alpha;
        }
    }
}