#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    local[id] = 0;

    float sum = 0;
    int maxSpatial = (spatial / threads) * threads;  

    for(int j = 0; j < batch; ++j){
        for(int i = id; i < maxSpatial; i += threads){
            int index = j * spatial * filters + filter * spatial + i;
            sum += pow(x[index] - mean[filter], 2);
        }
        if(id + maxSpatial < spatial) {  
            int index = j * spatial * filters + filter * spatial + id + maxSpatial;
            sum += pow(x[index] - mean[filter], 2);
        }
    }

    local[id] = sum;

    __syncthreads();  

    if (id == 0) {
        float variance_value = 0;
        for(int i = 0; i < threads; ++i){
            variance_value += local[i];
        }
        
        variance[filter] = variance_value / (spatial * batch - 1);
    }
}