#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_arrays_kernel(int32_t* __restrict a, const int32_t* __restrict b, const int64_t array_count) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a stride loop for scalability
    int stride = blockDim.x * gridDim.x;

    // Loop through the data with calculated stride
    for (; i < array_count; i += stride) {
        a[i] += b[i];
    }
}