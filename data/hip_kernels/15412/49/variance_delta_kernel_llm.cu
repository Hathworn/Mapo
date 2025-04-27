#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    // Compute unique thread index
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    
    // Return early if index exceeds the number of filters
    if (i >= filters) return;

    // Use shared memory to reduce repeated memory access
    extern __shared__ float shared_mem[];
    float *shared_mean = shared_mem;
    float *shared_variance = shared_mem + filters;

    // Load mean and variance into shared memory
    if (threadIdx.x < filters) {
        shared_mean[threadIdx.x] = mean[threadIdx.x];
        shared_variance[threadIdx.x] = variance[threadIdx.x];
    }

    // Sync threads to ensure shared memory is populated
    __syncthreads();
    
    // Initialize variance delta to zero
    float temp = 0.0f;
    
    // Compute variance delta for each batch and spatial dimension
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            temp += delta[index] * (x[index] - shared_mean[i]);
        }
    }
    
    // Scale variance delta with precomputed factor using shared variance
    variance_delta[i] = temp * (-0.5f * powf(shared_variance[i] + .000001f, -1.5f));
}
```
