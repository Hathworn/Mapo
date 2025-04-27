#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddDiagonal(float* mat, float* vec, float* tgtMat, unsigned int width) {
    // Calculate global index
    const unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    // It's not necessary to loop; each thread handles one diagonal element
    if (i < width) {
        tgtMat[width * i + i] = mat[width * i + i] + vec[i];
    }
}