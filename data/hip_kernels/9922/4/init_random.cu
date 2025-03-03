#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init_random(unsigned long long *seed, hiprandState  *global_state){
int tid = blockIdx.x;
unsigned long long local_seed = seed[tid];
hiprandState local_state;
local_state = global_state[tid];
hiprand_init(local_seed,tid,0, &local_state);
global_state[tid] = local_state;
}