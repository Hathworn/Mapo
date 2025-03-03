#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setupRandomKernel(hiprandState* states, unsigned long long seed) {
unsigned tid = blockDim.x * blockIdx.x + threadIdx.x;
hiprand_init(seed, tid, 0, &states[tid]);
}