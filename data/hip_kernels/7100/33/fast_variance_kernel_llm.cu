#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    // Initialize local shared memory
    local[id] = 0.0f;

    // Accumulate variance for each element processed by this thread
    for(int j = 0; j < batch; ++j){
        for(int i = id; i < spatial; i += threads){  // Optimize loop stride
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += pow((x[index] - mean[filter]), 2);
        }
    }

    // Use parallel reduction to sum up local variances
    __syncthreads();
    for(int offset = threads / 2; offset > 0; offset >>= 1) {
        if(id < offset) {
            local[id] += local[id + offset];
        }
        __syncthreads();
    }

    // Write final result to global memory
    if(id == 0) {
        variance[filter] = local[0] / (spatial * batch - 1);
    }
}