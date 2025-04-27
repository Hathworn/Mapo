#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inc(int *array, size_t n) {
    size_t idx = threadIdx.x + blockDim.x * blockIdx.x;
    size_t stride = blockDim.x * gridDim.x; // Pre-compute stride

    for (; idx < n; idx += stride) { // Use for-loop
        array[idx]++;
    }
}