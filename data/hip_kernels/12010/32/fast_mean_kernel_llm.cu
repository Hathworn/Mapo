#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0.0f;

    int filter = blockIdx.x;
 
    int j;
    for(j = 0; j < batch; ++j){
        for(int i = id; i < spatial; i += threads){
            // Combine the loop increment and index calculation
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += x[index];
        }
    }

    __syncthreads();  // Synchronize threads before reduction

    // Reduction with parallel summation
    for(int stride = threads / 2; stride > 0; stride >>= 1) {
        if(id < stride) {
            local[id] += local[id + stride];
        }
        __syncthreads();  // Ensure all additions are done before next stride
    }

    if(id == 0) {
        mean[filter] = local[0] / (spatial * batch);  // Directly compute the mean
    }
}