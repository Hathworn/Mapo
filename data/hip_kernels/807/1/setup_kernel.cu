#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setup_kernel ( hiprandState * state, unsigned long seed )
{
int id = blockIdx.x;
int sequence = id;
int offset = 0;
hiprand_init ( seed, sequence, offset, &state[id] );
}