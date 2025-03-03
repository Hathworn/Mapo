#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init_randoms(unsigned int seed, hiprandState_t* states) {
int index = blockDim.x * blockIdx.x + threadIdx.x;

hiprand_init(seed, index, 0, &states[index]);
}