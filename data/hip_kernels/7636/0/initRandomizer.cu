#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void initRandomizer(unsigned int seed, hiprandState* state){
int idx = blockIdx.x * blockDim.x + threadIdx.x;
hiprand_init(seed, idx, 0, &state[idx]);
}