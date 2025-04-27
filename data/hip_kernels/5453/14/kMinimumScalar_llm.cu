#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMinimumScalar(float* mat, float val, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Each thread processes multiple elements by striding over the data
    for (unsigned int i = idx; i < len; i += stride) {
        target[i] = fminf(mat[i], val);
    }
}