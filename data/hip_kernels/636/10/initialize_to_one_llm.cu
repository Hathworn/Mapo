#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initialize_to_one(uint32_t *reduction, uint32_t size)
{
    // Use blockIdx.x * blockDim.x + threadIdx.x for index calculation
    uint32_t t_index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we do not overflow the array bounds
    if (t_index < size) {
        reduction[t_index] = 1;
    }
}