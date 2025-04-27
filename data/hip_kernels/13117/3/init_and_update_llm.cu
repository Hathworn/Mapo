#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_and_update (float *values_d, int tpoints, int nsteps) {
    int idx = threadIdx.x + blockIdx.x * BLOCK_SIZE;

    if (idx <= 1 || idx >= tpoints)
        return;

    float old_v, v, new_v;
    float x = (float)(idx - 1) / (tpoints - 1); // Precompute temporary value as x

    v = sinf(2.0f * PI * x); // Use sinf for single precision performance
    old_v = v;

    float neg_coef_v = -0.18f * v; // Precompute constant multiplication outside the loop

    for (int i = 1; i <= nsteps; i++) {
        new_v = 2.0f * v - old_v + neg_coef_v; // Simplified arithmetic
        old_v = v;
        v = new_v;
    }

    values_d[idx] = v;
}