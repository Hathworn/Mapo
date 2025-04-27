#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride for loop unrolling

    // Loop unroll to fully utilize the GPU
    for (int i = index; i < N; i += stride) {
        int f = (i / spatial) % filters;
        float inv_std_dev = 1.0f / sqrtf(variance[f] + 0.00001f); // Precompute inverse standard deviation

        // Cache repeated computation to minimize latency
        float var_adj = variance_delta[f] * 2.f * (x[i] - mean[f]) / (spatial * batch);
        float mean_adj = mean_delta[f] / (spatial * batch);

        delta[i] = delta[i] * inv_std_dev + var_adj + mean_adj;
    }
}