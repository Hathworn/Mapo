#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void testKernel4r(float *data1, float *data2)
{
    float t = 0.0f;
    float c = 0.0f;
    int idx = NX * blockIdx.x + threadIdx.x; // Precompute index
    int idx_prev = NX * (blockIdx.x - 1) + threadIdx.x;
    int idx_next = NX * (blockIdx.x + 1) + threadIdx.x;

    if (blockIdx.x > 0) {
        t += (data2[idx_prev] - data2[idx]); // Use precomputed indices
        c += 1.0f;
    }
    if (blockIdx.x < NX - 1) {
        t += (data2[idx_next] - data2[idx]);
        c += 1.0f;
    }
    if (threadIdx.x > 0) {
        t += (data2[idx - 1] - data2[idx]);
        c += 1.0f;
    }
    if (threadIdx.x < NX - 1) {
        t += (data2[idx + 1] - data2[idx]);
        c += 1.0f;
    }

    if (blockIdx.x == 0)
        data1[idx] = 1.0f;
    else
        data1[idx] = data2[idx] + t / c * DIFF_RATE;

    return;
}