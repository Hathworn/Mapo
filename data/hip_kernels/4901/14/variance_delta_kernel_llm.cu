#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    // Calculate the index for this thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return; // Boundary check

    // Initialize variance_delta for the filter to zero
    float v_delta = 0.0f;
    
    // Use shared memory to cache mean and variance for faster access
    __shared__ float shared_mean[1024];
    __shared__ float shared_variance[1024];
    
    if (threadIdx.x < filters) {
        shared_mean[threadIdx.x] = mean[threadIdx.x];
        shared_variance[threadIdx.x] = variance[threadIdx.x];
    }
    __syncthreads();

    // Accumulate variance_delta
    for(int j = 0; j < batch; ++j){
        for(int k = 0; k < spatial; ++k){
            int index = j * filters * spatial + i * spatial + k;
            v_delta += delta[index] * (x[index] - shared_mean[i]);
        }
    }

    // Store the result with optimized variance calculation
    variance_delta[i] = v_delta * (-0.5f) * powf(shared_variance[i] + 1e-6f, -1.5f);
}