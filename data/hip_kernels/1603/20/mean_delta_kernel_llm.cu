#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float sum = 0;
    int num_elements = batch * spatial;
    int offset = i * spatial;

    // Unroll the loop to enhance performance
    for (int index = 0; index < num_elements; index += spatial) {
        #pragma unroll
        for (int k = 0; k < spatial; ++k) {
            sum += delta[index + offset + k];
        }
    }

    mean_delta[i] = sum * (-1.f / sqrtf(variance[i] + .00001f));
}