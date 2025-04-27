#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generate_uniform_kernel(float *generated_out, hiprandState_t *state)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate the stride to allow threads in a block to generate multiple random numbers
    int stride = blockDim.x * gridDim.x;

    // Use loop to process more elements per thread
    for (int i = idx; i < N; i += stride)
    {
        generated_out[i] = hiprand_uniform(&state[i]);
    }
}