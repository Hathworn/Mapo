#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAddColMult(float* mat, float* vec, float* tgtMat, float mult, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;  // Use 'stride' instead of 'numThreads'

    for (unsigned int i = idx; i < width * height; i += stride) {
        unsigned int row = i % height;  // Calculate row once per iteration
        tgtMat[i] = mat[i] + mult * vec[row];
    }
}