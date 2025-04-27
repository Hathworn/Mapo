#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kGreaterThan(float* __restrict__ mat1, float* __restrict__ mat2, float* __restrict__ target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < len) {
        // Determine if mat1 element is greater than mat2 element
        target[idx] = mat1[idx] > mat2[idx];
    }
}