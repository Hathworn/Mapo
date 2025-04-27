#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sqrt_kerneld(double *v, int n) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    if (x < n) {
        // Calculate square root within bounds
        v[x] = sqrt(v[x]);
    }
}