#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void decrement_dynamic_kernel(int* pInts, size_t numInts)
{
    // Calculate global thread index
    size_t idx = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Optimize boundary condition check
    if (idx < numInts) {
        pInts[idx] -= 1;
    }
}