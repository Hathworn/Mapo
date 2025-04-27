#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivideByRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate total number of elements
    const unsigned int totalElements = width * height;
    
    // Loop through elements with a stride of total threads
    for (unsigned int i = idx; i < totalElements; i += gridDim.x * blockDim.x) {
        // Efficient division with __fdividef
        tgtMat[i] = __fdividef(mat[i], vec[i % width]);
    }
}