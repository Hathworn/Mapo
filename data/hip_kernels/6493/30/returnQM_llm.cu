#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void returnQM ( const int dim, const int n, const float *s1, const float *s0, float *q ) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop unrolling for improved performance
    for (int idx = i; idx < n; idx += blockDim.x * gridDim.x) {
        float diff = s1[idx] - s0[idx]; // Store repeated subexpression
        q[idx] = expf(-0.5f * diff); // Compute once per iteration
    }
}