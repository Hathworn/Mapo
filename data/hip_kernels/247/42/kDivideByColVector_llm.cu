#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivideByColVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate thread's 2D position within the matrix
    unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;

    // Optimize loop to directly handle data assigned to each thread
    for (unsigned int i = col; i < width * height; i += stride) {
        // Divide each element in the column by the corresponding vector element
        tgtMat[i] = __fdividef(mat[i], vec[i / width]);
    }
}