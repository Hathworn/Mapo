#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLogistic1(float* gData, float* target, unsigned int numElements) {
const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

for (unsigned int i = idx; i < numElements; i += blockDim.x * gridDim.x)
target[i] = (1 + tanhf(gData[i] / 2)) / 2;
}