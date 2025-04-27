#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_and_update(float *values_d, int tpoints, int nsteps) {
    int idx = threadIdx.x + blockIdx.x * BLOCK_SIZE;

    if (idx <= 1 || idx >= tpoints)
        return;

    float old_v, v, new_v;
    float x, tmp;
    tmp = tpoints - 1;
    x = (float)(idx - 1) / tmp;

    v = sinf(2.0f * PI * x);  // Use sinf for improved performance with float
    old_v = v;

    float coeff = 0.82f;  // Precompute constant component for efficiency

    for (int i = 1; i <= nsteps; i++) {
        new_v = coeff * v - old_v;
        old_v = v;
        v = new_v;
    }

    values_d[idx] = v;
}