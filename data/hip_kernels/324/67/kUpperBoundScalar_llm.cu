#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kUpperBoundScalar(float* mat, float val, float* target, unsigned int len) {
    // Calculate global thread index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop through data using stride to ensure all elements are processed
    while (idx < len) {
        target[idx] = mat[idx] > val ? val : mat[idx];
        idx += blockDim.x * gridDim.x;  // Move to the next data chunk
    }
}