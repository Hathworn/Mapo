#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sigmoid32(float* A, int size)
{
int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
int idx = blockId * (blockDim.x * blockDim.y * blockDim.z) + (threadIdx.z * (blockDim.x * blockDim.y)) + (threadIdx.y * blockDim.x) + threadIdx.x;
if (idx >= size) {
return;
}
A[idx] = 1 / (1 + powf((float)(M_E), (-1 * A[idx])));
}