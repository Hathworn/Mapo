#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void random(double *x, hiprandState *global_state){
int tid =  blockIdx.x;
hiprandState local_state;
local_state = global_state[tid];
x[tid] = (double) hiprand(&local_state);
global_state[tid] = local_state;
}