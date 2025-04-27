#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    
    float sum = 0.0f; // Use register for accumulating sum

    // Loop unrolling for spatial
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) { // Stride by number of threads
            int index = j * spatial * filters + filter * spatial + i;
            sum += pow((x[index] - mean[filter]), 2);
        }
    }
    
    local[id] = sum;
    __syncthreads();
    
    // Reduction within block
    if (id == 0) {
        sum = 0.0f;
        for (int i = 0; i < threads; ++i) {
            sum += local[i];
        }
        variance[filter] = sum / (spatial * batch - 1);
    }
}