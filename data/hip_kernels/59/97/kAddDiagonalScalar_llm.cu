#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddDiagonalScalar(float* mat, float val, float* tgtMat, unsigned int width) {
    // Compute the unique thread index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Increment index by total number of threads to process all diagonal elements
    while (i < width) {
        tgtMat[width*i + i] = mat[width*i + i] + val; // Update diagonal element
        i += blockDim.x * gridDim.x;
    }
}