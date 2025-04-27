#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Use shared memory for temporary storage to reduce global memory access
    __shared__ float s_variance_delta[1024];
    s_variance_delta[threadIdx.x] = 0;

    // Calculate variance_delta with effective memory access 
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            s_variance_delta[threadIdx.x] += delta[index] * (x[index] - mean[i]);
        }
    }

    __syncthreads(); // Synchronize to ensure all calculations are complete before writing to global memory
    
    variance_delta[i] = s_variance_delta[threadIdx.x] * -.5f * powf(variance[i] + .00001f, -1.5f);
}