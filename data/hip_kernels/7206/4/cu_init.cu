#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cu_init(unsigned long long seed, hiprandState_t * states_d, size_t size) {
int idx = threadIdx.x + blockIdx.x * blockDim.x;
if(idx < size) {
hiprand_init(seed, idx, 0, &states_d[idx]);
}
}