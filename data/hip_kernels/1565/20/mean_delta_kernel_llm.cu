#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    // Use shared memory for partial sum accumulation.
    extern __shared__ float shared_delta[];
    
    int tx = threadIdx.x;
    int index = blockIdx.x * blockDim.x + tx;
    shared_delta[tx] = 0;
    
    // Reduce unnecessary calculations by using the step size of block size.
    for (int j = 0; j < batch; ++j) {
        for (int k = tx; k < spatial; k += blockDim.x) {
            int global_index = j * filters * spatial + blockIdx.x * spatial + k;
            if (global_index < batch * filters * spatial) {
                shared_delta[tx] += delta[global_index];
            }
        }
    }
    
    __syncthreads();

    // Reduction within block
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tx < stride) {
            shared_delta[tx] += shared_delta[tx + stride];
        }
        __syncthreads();
    }
    
    // Only thread 0 writes result back to global memory
    if (tx == 0) {
        mean_delta[blockIdx.x] = shared_delta[0] * (-1.f / sqrtf(variance[blockIdx.x] + .00001f));
    }
}