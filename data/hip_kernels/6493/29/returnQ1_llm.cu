#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void returnQ1(const int dim, const int n, const float *p1, const float *p0, const float *s1, const float *s0, const float *zr, float *q) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < n) {
        float diff = -0.5f * (s1[i] + p1[i] - s0[i] - p0[i]); // Precompute reused expression
        if (p1[i] == INF || diff < -10.0f) {
            q[i] = 0.0f;
        } else if (diff > 10.0f) {
            q[i] = 1.0e10f; // Use float literal suffix
        } else {
            q[i] = expf(diff) * powf(zr[i], dim - 1); // Use precomputed value
        }
    }
}