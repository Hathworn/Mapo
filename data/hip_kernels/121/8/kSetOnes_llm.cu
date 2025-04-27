#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetOnes(float *dest, int count) {
    // Use block and grid indices to ensure unique threads for each element
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < count) {
        dest[idx] = 1.0f;
    }
}