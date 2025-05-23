#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cudaIaccumulate_kernel(int* x, int* y, unsigned int size)
{
const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
const unsigned int stride = blockDim.x * gridDim.x;

for (unsigned int i = index; i < size; i += stride) {
x[i] += y[i];
}
}