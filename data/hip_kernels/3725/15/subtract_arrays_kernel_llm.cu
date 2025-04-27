#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subtract_arrays_kernel(int32_t* __restrict a, const int32_t* __restrict b, const int64_t array_count) {
    const int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Using a single global index calculation
    if (i < array_count) {
        // Check if index is within bounds and perform operation
        a[i] -= b[i];
    }
}