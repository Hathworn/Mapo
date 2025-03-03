#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init_rand_states_kernel(hiprandState *state, int seed)
{
int id = threadIdx.x + blockIdx.x * blockDim.x;
/* Each thread gets same seed, a different sequence
number, no offset */
hiprand_init(seed, id, 0, &state[id]);
}