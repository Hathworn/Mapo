#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void generate_kernel(unsigned int *generated_out, hiprandState_t *state)
{
int idx = blockIdx.x * blockDim.x + threadIdx.x;

generated_out[idx] = hiprand(&state[idx]);
}