```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generate_uniform_kernel(float *generated_out, hiprandState_t *state)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index

    if(idx < gridDim.x * blockDim.x) // Ensure idx is within bounds
    {
        generated_out[idx] = hiprand_uniform(&state[idx]); // Generate a uniform random number
    }
}