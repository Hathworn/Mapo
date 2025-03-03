#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void initialise_curand_on_kernels(hiprandState* state, unsigned long seed) {
int idx = blockIdx.x*blockDim.x+threadIdx.x;
hiprand_init(seed, idx, 0, &state[idx]);
}