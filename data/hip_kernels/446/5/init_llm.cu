#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(unsigned int seed, hiprandState_t* states) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Calculate a unique global index
    /* initialize the state with a unique sequence number for each thread */
    hiprand_init(seed, id, 0, &states[id]);
}