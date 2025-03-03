#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void __randinit(unsigned long long seed, unsigned long long offset, hiprandState *rstates) {
int id = threadIdx.x + blockDim.x * blockIdx.x;
hiprand_init(seed, id, offset, &rstates[id]);
}