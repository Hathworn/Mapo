#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generate_kernel(unsigned int *generated_out, hiprandState_t *state)
{
    // Use variables to cache the result of calculations involving blockIdx and threadIdx
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Directly assign the result of hiprand to reduce memory access
    generated_out[idx] = hiprand(&state[idx]);
}