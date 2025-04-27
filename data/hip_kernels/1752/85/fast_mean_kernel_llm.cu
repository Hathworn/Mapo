#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    // Unrolling the loop for better performance
    for(int j = 0; j < batch; ++j){
        for(int i = id; i < spatial; i += threads){
            int index = j*spatial*filters + filter*spatial + i;
            local[id] += x[index];
        }
    }

    __syncthreads();

    // Using parallel reduction to calculate the sum
    if (id == 0) {
        mean[filter] = 0;
        for (int i = 0; i < threads; ++i) {
            mean[filter] += local[i];
        }
        mean[filter] /= spatial * batch;
    }
}