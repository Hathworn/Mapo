#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_random_seed(unsigned int seed, hiprandState_t *d_curand_state) {
    int neuron = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid-stride loop to ensure scalability and handle larger problem sizes
    for (int i = neuron; i < NEURON_COUNT; i += gridDim.x * blockDim.x) {
        hiprand_init(seed, i, 0, &d_curand_state[i]);
    }
}