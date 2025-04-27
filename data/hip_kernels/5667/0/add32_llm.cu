#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void add32(float* A, float *B, int size) {
    // Use blockDim.x, y, z and threadIdx.x, y, z for more concise index calculation
    int index = threadIdx.x + blockDim.x * (threadIdx.y + blockDim.y * (threadIdx.z + blockDim.z * (blockIdx.x + blockDim.x * (blockIdx.y + blockDim.y * blockIdx.z))));
    if (index < size) {
        A[index] += B[index];
    }
}