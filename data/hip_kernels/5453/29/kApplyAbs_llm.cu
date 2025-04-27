#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplyAbs(float* mat, float* target, unsigned int len) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop through each index stride by total number of threads
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        // Utilize built-in abs function for readability and potential performance gain
        target[i] = fabsf(mat[i]);
    }
}