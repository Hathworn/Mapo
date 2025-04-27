#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    // Calculate the index of the current thread in the grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure the thread index is within bounds
    if (i >= filters) return;
    float temp_sum = 0.0f;

    // Compute indices in a loop to accumulate the sum
    for (int j = 0; j < batch; ++j){
        for (int k = 0; k < spatial; ++k){
            int index = j * filters * spatial + i * spatial + k;
            temp_sum += delta[index] * (x[index] - mean[i]);
        }
    }
    // Do final computation on temp_sum
    variance_delta[i] = temp_sum * -.5f * powf(variance[i] + .00001f, -1.5f);
}