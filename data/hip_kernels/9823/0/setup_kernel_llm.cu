#include "hip/hip_runtime.h"
#include "includes.h"
#ifdef ENABLE_CUDA
#pragma GCC diagnostic push
#pragma GCC diagnostic pop
#endif

#define SIZE 256

__global__ void setup_kernel(hiprandStateMRG32k3a *state, unsigned int seed) {
    // Using blockDim to accommodate any grid size and improve scalability
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    hiprand_init(seed, id, 0, &state[id]);
}