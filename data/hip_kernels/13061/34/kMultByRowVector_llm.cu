#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kMultByRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate the linear index for the current thread
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by using a proper grid-stride loop for better occupancy
    unsigned int stride = blockDim.x * gridDim.x;

    // Iterate over the matrix with grid-stride loop
    while (idx < width * height) {
        tgtMat[idx] = mat[idx] * vec[idx % width];
        idx += stride;
    }
}