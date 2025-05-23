#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kApplySin(float* mat, float* target, unsigned int len) {
const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
const unsigned int numThreads = blockDim.x * gridDim.x;
for (unsigned int i = idx; i < len; i += numThreads) target[i] = __sinf(mat[i]);
}