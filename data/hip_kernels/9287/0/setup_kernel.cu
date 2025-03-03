#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setup_kernel(  hiprandState * state, unsigned long seed )
{
int id = threadIdx.x + blockIdx.x * blockDim.x;
hiprand_init( seed, id, 0, &state[ id ] );

return;
}