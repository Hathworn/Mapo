#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;
    float mean_value = mean[filter]; // Load mean once to reduce global memory access

    for(int j = 0; j < batch; ++j){
        for(int i = id; i < spatial; i += threads){
            int index = j * spatial * filters + filter * spatial + i;
            if(i < spatial) {
                float diff = x[index] - mean_value;
                local[id] += diff * diff; // Use intermediate variable to avoid redundant powf call
            }
        }
    }

    __syncthreads();

    if(id == 0){
        variance[filter] = 0;
        for(int i = 0; i < threads; ++i){
            variance[filter] += local[i];
        }
        variance[filter] /= (spatial * batch - 1);
    }
}