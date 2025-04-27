#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Pre-calculate scale factor
    float scale = 1.f/(batch * spatial);

    // Optimize index calculation
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Use shared memory for partial sums (optional, depending on workload and memory constraints)
    extern __shared__ float shared_mean[];
    shared_mean[threadIdx.x] = 0;

    // Optimize loop order for better memory access and coalescing
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * spatial * filters + k * filters + i;
            shared_mean[threadIdx.x] += x[index];
        }
    }

    // Finalize the mean calculation
    mean[i] = shared_mean[threadIdx.x] * scale;
}