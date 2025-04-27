#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D block index for simplicity
    if (i >= filters) return;

    float sum_delta = 0; // Initialize local sum
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j*filters*spatial + i*spatial + k;
            sum_delta += delta[index]; // Accumulate in local variable
        }
    }
    mean_delta[i] = sum_delta * (-1.f/sqrtf(variance[i] + .00001f)); // Compute mean_delta
}