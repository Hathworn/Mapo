#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetOnes(float *dest, int count) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    int stride = blockDim.x * gridDim.x;             // Calculate stride for grid stride loop

    for (int i = idx; i < count; i += stride) {
        dest[i] = 1;                                  // Set value to 1
    }
}