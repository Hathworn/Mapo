#include "hip/hip_runtime.h"
#include "includes.h"
#ifdef ENABLE_CUDA
#pragma GCC diagnostic push
#pragma GCC diagnostic pop
#endif


#define SIZE 256



__global__ void run_kernel(hiprandStateMRG32k3a *state, unsigned int *result) {
int id = threadIdx.x + blockIdx.x * SIZE;
hiprandStateMRG32k3a localState = state[id];
unsigned int x = hiprand(&localState);
while (x == 0) {
x = hiprand(&localState);
}
state[id] = localState;
result[id] = x;
}