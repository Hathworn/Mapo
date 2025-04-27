#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSoftMaxGradRowMajor(float* mat, float* labels, float* target, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Loop through the data with striding
    for (unsigned int i = idx; i < width * height; i += stride) {
        // Calculate target only once per thread
        unsigned int row = i / height;
        unsigned int col = i % height;
        target[i] = mat[i] - ((int)labels[col] == row ? 1 : 0);
    }
}