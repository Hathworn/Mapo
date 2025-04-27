#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float mean_sum = 0.0f; // Initialize accumulator
    int total_elements = batch * spatial;

    // Unroll loop to efficiently compute mean_sum for batches and spatial elements
    for (int j = 0; j < total_elements; ++j) {
        int index = j * filters + i;
        mean_sum += delta[index];
    }

    mean_delta[i] = mean_sum * (-1.0f / sqrtf(variance[i] + 0.000001f)); // Pre-calculate factor outside the loop
}