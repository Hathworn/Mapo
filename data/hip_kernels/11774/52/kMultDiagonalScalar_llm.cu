#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kMultDiagonalScalar(float* mat, float val, float* tgtMat, unsigned int width) {
    // Optimize by calculating stride for better memory access coalescing
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    for (unsigned int i = idx; i < width; i += stride) {
        // Access matrix diagonally and perform multiplication
        const unsigned int elementIndex = width * i + i;
        tgtMat[elementIndex] = mat[elementIndex] * val;
    }
}