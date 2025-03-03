#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setupKernel(hiprandState *state, unsigned long long seed) {
int idx = threadIdx.x + blockDim.x * blockIdx.x;
hiprand_init(seed, idx, 0, &state[idx]);
}