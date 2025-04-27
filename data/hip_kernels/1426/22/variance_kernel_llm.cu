#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Use shared memory for variance calculation
    extern __shared__ float shared_variance[];
    
    float scale = 1.f/(batch * spatial - 1);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;
    
    // Initialize shared memory
    shared_variance[threadIdx.x] = 0;

    // Use striding over batch and spatial dimensions
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            shared_variance[threadIdx.x] += powf((x[index] - mean[i]), 2);
        }
    }
    
    // Write shared variance to global memory
    __syncthreads();
    variance[i] = shared_variance[threadIdx.x] * scale;
}