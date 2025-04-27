#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Sum(float * A, float * B, float * C, int size) {
// Calculate unique thread index using 1D block and grid configuration
int id = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x;
// Perform addition only if within bounds
if (id < size) {
    C[id] = A[id] + B[id];
}
}