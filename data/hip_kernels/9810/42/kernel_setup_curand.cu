#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_setup_curand(hiprandState *state, int seed, int n)
{
int id = threadIdx.x + blockIdx.x *  blockDim.x ;
/* Each thread gets same seed , a different sequence number - no offset */
if(id<n)
hiprand_init(seed, id, 0, &state[id]) ;
}