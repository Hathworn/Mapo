#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GPU_vector_add(int* left, int* right, int* result, int size)
{
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Boundary check to prevent out-of-bounds access
    if (idx < size) {
        result[idx] = left[idx] + right[idx];
    }
}