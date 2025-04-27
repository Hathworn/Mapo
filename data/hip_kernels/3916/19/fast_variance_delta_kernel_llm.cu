#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = blockDim.x;  // Use blockDim.x for portability
    __shared__ float local[BLOCK];  // Allocate for max BLOCK size
    
    int id = threadIdx.x;
    local[id] = 0.0f;
    
    int filter = blockIdx.x;
    
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {  // Increment by threads
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += (i < spatial) ? delta[index] * (x[index] - mean[filter]) : 0.0f;
        }
    }
    
    __syncthreads();
    
    if (id == 0) {
        float sum = 0.0f;
        for (int i = 0; i < threads; ++i) {
            sum += local[i];  // Accumulate in a local variable
        }
        variance_delta[filter] = sum * -0.5f * powf(variance[filter] + 0.00001f, -1.5f);
    }
}