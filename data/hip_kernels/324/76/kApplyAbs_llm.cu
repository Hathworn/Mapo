#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplyAbs(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a single loop iteration to optimize performance
    if (idx < len) {
        target[idx] = fabsf(mat[idx]); // Utilize fast math function for absolute value
    }
}