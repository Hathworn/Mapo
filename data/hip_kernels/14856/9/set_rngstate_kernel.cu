#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void set_rngstate_kernel(hiprandStateMtgp32 *state, mtgp32_kernel_params *kernel)
{
state[threadIdx.x].k = kernel;
}