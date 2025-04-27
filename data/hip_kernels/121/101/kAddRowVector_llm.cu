#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height) {
    const unsigned int threadID = blockIdx.x * blockDim.x + threadIdx.x; // Compute unique thread ID
    const unsigned int stride = gridDim.x * blockDim.x; // Calculate stride

    // Use stride to update matrix more efficiently, promoting data locality
    for (unsigned int i = threadID; i < width * height; i += stride) {
        unsigned int rowIdx = i / width; // Compute row index
        tgtMat[i] = mat[i] + vec[rowIdx]; // Add corresponding row vector element
    }
}