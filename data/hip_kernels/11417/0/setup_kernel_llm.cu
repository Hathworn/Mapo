```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define PI 3.14159265359
#define DEG_TO_RAD (PI / 180.0)

typedef unsigned char byte;

__global__ void setup_kernel(hiprandState* state, unsigned long seed)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Use cooperative thread array indexing for better performance
    hiprandState localState;
    hiprand_init(seed, id, 0, &localState);
    state[id] = localState;
}