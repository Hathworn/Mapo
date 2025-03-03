#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_curand_init(hiprandState *state, int seed)
{
// Each possible thread uses same seed, but different sequence number
// (as suggested by CURAND docs)
int global_id = blockDim.x*blockIdx.x + threadIdx.x;
hiprand_init(seed,global_id,0,&state[global_id]);
}