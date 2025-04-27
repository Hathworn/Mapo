#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultDiagonal(float* mat, float* vec, float* tgtMat, unsigned int width) {
    // Calculate unique thread index with adjusted grid-stride loop
    for (unsigned int i = blockIdx.x * blockDim.x + threadIdx.x; i < width; i += blockDim.x * gridDim.x) {
        // Perform the diagonal multiplication
        tgtMat[width * i + i] = mat[width * i + i] * vec[i];
    }
}