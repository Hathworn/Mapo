#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    int filter_id = threadIdx.x + blockIdx.x * blockDim.x; // Direct thread index calculation
    if (filter_id >= filters) return;

    float variance_value = variance[filter_id] + 0.000001f;
    float inv_variance = -0.5f * powf(variance_value, -1.5f); // Pre-compute invariant part

    for (int j = 0; j < batch; ++j)
    {
        for (int k = 0; k < spatial; ++k)
        {
            int index = j * filters * spatial + filter_id * spatial + k;
            variance_delta[filter_id] += delta[index] * (x[index] - mean[filter_id]);
        }
    }
    variance_delta[filter_id] *= inv_variance; // Efficient multiplication with pre-computed value
}