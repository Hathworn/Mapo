#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kFloor(float* mat, float* target, unsigned int len) {
    // Calculate flattened thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process elements that this thread is responsible for
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        target[i] = floorf(mat[i]); // Use floorf for single precision float
    }
}