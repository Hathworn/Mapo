#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Using shared memory to cache mean values
    extern __shared__ float shared_mean[];
    int tid = threadIdx.x;

    // Calculate global thread index
    int global_idx = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + tid;
    if (tid < filters) {
        shared_mean[tid] = mean[tid];
    }
    __syncthreads();

    if (global_idx >= filters) return;

    float var = 0.0f;
    float scale = 1.f / (batch * spatial - 1);

    // Unrolling the loops to optimize performance
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; k += 4) {
            int index = j * filters * spatial + global_idx * spatial + k;
            float tmp1 = (index < batch * filters * spatial) ? x[index] - shared_mean[global_idx] : 0;
            float tmp2 = (index + 1 < batch * filters * spatial) ? x[index + 1] - shared_mean[global_idx] : 0;
            float tmp3 = (index + 2 < batch * filters * spatial) ? x[index + 2] - shared_mean[global_idx] : 0;
            float tmp4 = (index + 3 < batch * filters * spatial) ? x[index + 3] - shared_mean[global_idx] : 0;
            var += tmp1 * tmp1 + tmp2 * tmp2 + tmp3 * tmp3 + tmp4 * tmp4;
        }
    }
    variance[global_idx] = var * scale;
}