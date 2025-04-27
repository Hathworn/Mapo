#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_arrays_kernel(int64_t* __restrict a, const int64_t* __restrict b, const int64_t array_count) {
    // Calculate global index for the current thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by using a single if condition instead of a loop
    if (index < array_count) {
        a[index] += b[index];
    }
}