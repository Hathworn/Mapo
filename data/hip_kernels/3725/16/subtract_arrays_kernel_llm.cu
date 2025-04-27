#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subtract_arrays_kernel(int64_t* __restrict a, const int64_t* __restrict b, const int64_t array_count) {
    // Use a single stride loop with direct calculation to minimize idle threads
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for (; i < array_count; i += stride) {
        a[i] -= b[i];
    }
}