#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddDiagonalScalar(float* mat, float val, float* tgtMat, unsigned int width) {
    // Calculate row index for the diagonal element
    const unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure only valid diagonal index threads access the array
    if (i < width) {
        tgtMat[width * i + i] = mat[width * i + i] + val;
    }
}