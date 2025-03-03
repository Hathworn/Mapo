#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setup_kernel ( hiprandState *state, unsigned long seed )
{
hiprand_init ( seed, 0, 0, &state[0] );
}