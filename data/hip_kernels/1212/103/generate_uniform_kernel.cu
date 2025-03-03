#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void generate_uniform_kernel(float *generated_out, hiprandState_t *state)
{
int idx = blockIdx.x * blockDim.x + threadIdx.x;

generated_out[idx] = hiprand_uniform(&state[idx]);
}