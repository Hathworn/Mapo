#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setup_kernel(long long seed, hiprandState_t* devStates, ushort N){
int idx = blockIdx.x * blockDim.x + threadIdx.x;
int i;
for(i=idx;i<N;i+=gridDim.x*blockDim.x)
hiprand_init(seed, i, 0, &devStates[i]);
}