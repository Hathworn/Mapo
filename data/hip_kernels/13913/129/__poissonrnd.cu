#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void __poissonrnd(int n, float *A, int *B, hiprandState *rstates) {
int id = threadIdx.x + blockDim.x * blockIdx.x;
int nthreads = blockDim.x * gridDim.x;
hiprandState rstate = rstates[id];
for (int i = id; i < n; i += nthreads) {
int cr = hiprand_poisson(&rstate, A[i]);
B[i] = cr;
}
}