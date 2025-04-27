#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(unsigned int seed, hiprandState_t* states) {
    // Calculate unique ID for the thread
    unsigned int stateid = blockIdx.x * blockDim.x + threadIdx.x;

    /* Initialize the state with a unique sequence number for each thread */
    hiprand_init(seed, stateid, 0, &states[stateid]);
}