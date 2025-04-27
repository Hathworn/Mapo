#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddColMult(float* mat, float* vec, float* tgtMat, float mult, unsigned int width, unsigned int height) {
    // Calculate global index
    const unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread does not access out-of-bounds memory
    if (i < width * height) {
        // Perform multiplication and addition
        tgtMat[i] = mat[i] + mult * vec[i % height];
    }
}