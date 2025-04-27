#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __poissonrnd(int n, float *A, int *B, hiprandState *rstates) {
    int id = threadIdx.x + blockDim.x * blockIdx.x;
    int nthreads = blockDim.x * gridDim.x;

    // Precompute random state once per thread
    hiprandState rstate = rstates[id];

    // Modified loop to reduce branch divergence and optimize utilization
    for (int i = id; i < n; i += nthreads) {
        if (i < n) {
            int cr = hiprand_poisson(&rstate, A[i]);
            B[i] = cr;
        }
    }

    // Save back the modified random state
    rstates[id] = rstate;
}