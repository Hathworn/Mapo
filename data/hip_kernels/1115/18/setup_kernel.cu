#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setup_kernel ( hiprandState * states, unsigned long seed ){
const int tid = threadIdx.x + blockIdx.x * blockDim.x;
hiprand_init ( seed+tid*4, tid, 0, &states[tid] );
}