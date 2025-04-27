#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial) {
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (index >= N) return;

    int b = index / spatial;
    int i = index % spatial;
    int offset = b * filters * spatial + i;
    float sum = 0.0f;

    // Unroll the loop for better performance
    #pragma unroll
    for (int f = 0; f < filters; ++f) {
        int idx = offset + f * spatial;
        sum += x[idx] * x[idx];
    }

    sum = sqrtf(sum);
    if (sum == 0.0f) sum = 1.0f;

    // Combine operations to reduce memory accesses
    for (int f = 0; f < filters; ++f) {
        int idx = offset + f * spatial;
        float x_val = x[idx] / sum;
        x[idx] = x_val;
        dx[idx] = (1.0f - x_val) / sum;
    }
}