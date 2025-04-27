#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Return early if out of filter index
    if (i >= filters) return;

    // Use shared memory to reduce global memory access
    __shared__ float shared_delta;
    shared_delta = 0.0f;

    int j, k;
    float local_mean_delta = 0.0f;
    for (j = 0; j < batch; j++) {
        for (k = 0; k < spatial; k++) {
            int index = j * filters * spatial + i * spatial + k;
            local_mean_delta += delta[index];
        }
    }
    // Normalize mean_delta using variance
    mean_delta[i] = local_mean_delta * (-1.f / sqrtf(variance[i] + .00001f));
}