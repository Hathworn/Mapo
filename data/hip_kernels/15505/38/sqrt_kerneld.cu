#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sqrt_kerneld(double *v, int n) {
int x(threadIdx.x + blockDim.x * blockIdx.x);
if (x >= n) return;

v[x] = sqrt(v[x]);
}