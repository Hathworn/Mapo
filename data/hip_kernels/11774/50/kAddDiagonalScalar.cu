#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAddDiagonalScalar(float* mat, float val, float* tgtMat, unsigned int width) {
const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
const unsigned int numThreads = blockDim.x * gridDim.x;

for (unsigned int i = idx; i < width; i += numThreads) {
tgtMat[width*i + i] = mat[width*i + i] + val;
}
}