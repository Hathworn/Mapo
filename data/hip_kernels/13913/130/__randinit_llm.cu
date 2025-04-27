#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel for better performance
__global__ void __randinit(unsigned long long seed, unsigned long long offset, hiprandState *rstates) {
    int id = threadIdx.x + blockDim.x * blockIdx.x;
    // Use cooperative groups to ensure proper initialization
    if (id < gridDim.x * blockDim.x) {
        hiprand_init(seed, id, offset, &rstates[id]);
    }
}