#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void task2Kernel(unsigned const* a, unsigned const* b, unsigned* result, size_t size)
{
    // Calculate global index for threads
    auto index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop to handle all elements beyond block size
    for (; index < size; index += blockDim.x * gridDim.x) {
        result[index] = a[index] * b[index];
    }
}