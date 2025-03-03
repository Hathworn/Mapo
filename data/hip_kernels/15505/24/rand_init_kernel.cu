#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rand_init_kernel(int seed, hiprandStatePhilox4_32_10_t *states, int n) {
int x(threadIdx.x + blockDim.x * blockIdx.x);

if (x < n)
hiprand_init(seed, x, 0, &states[x]);
}