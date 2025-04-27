#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kUpperBoundModScalar(float* mat, float val, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a grid-stride loop for better performance
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        float matVal = mat[i];
        target[i] = matVal > val ? val : (matVal < -val ? -val : matVal);
    }
}