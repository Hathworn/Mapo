#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kGreaterThanScalar(float* mat, float val, float* target, unsigned int len) {
    // Calculate the global index of the thread
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure that only valid indices are processed
    if (idx < len) {
        target[idx] = mat[idx] > val;
    }
}