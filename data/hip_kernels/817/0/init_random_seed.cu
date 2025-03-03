#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init_random_seed(unsigned int seed, hiprandState_t *d_curand_state) {
int neuron = blockIdx.x*blockDim.x + threadIdx.x;
hiprand_init(seed, neuron, 0, &d_curand_state[neuron]);
}