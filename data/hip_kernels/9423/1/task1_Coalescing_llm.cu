#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void task1_Coalescing(unsigned const* a, unsigned const* b, unsigned* result, size_t size)
{
    // Calculate index and check bounds
    unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < size) {
        // Perform multiplication for coalesced access
        result[index] = a[index] * b[index];
    }
}