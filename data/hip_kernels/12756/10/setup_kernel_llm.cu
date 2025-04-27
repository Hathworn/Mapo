#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized setup_kernel function
__global__ void setup_kernel (hiprandState * state, unsigned long seed )
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Non-conflicting register name
    hiprand_init(seed, idx, 0, &state[idx]); // Direct indexing without unnecessary variable
}