#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    int i, j;
    float sum = 0.0f;

    // Unroll loop to improve performance
    for(j = 0; j < batch; ++j) {
        for(i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            sum += delta[index] * (x[index] - mean[filter]);
        }
    }

    local[id] = sum;
    __syncthreads();

    // Use reduction to aggregate values
    if (threads >= 1024 && id < 512) local[id] += local[id + 512];
    __syncthreads();
    if (threads >= 512 && id < 256) local[id] += local[id + 256];
    __syncthreads();
    if (threads >= 256 && id < 128) local[id] += local[id + 128];
    __syncthreads();
    if (threads >= 128 && id < 64) local[id] += local[id + 64];
    __syncthreads();
    
    if (id < 32) {
        volatile float* vlocal = local;
        vlocal[id] += vlocal[id + 32];
        vlocal[id] += vlocal[id + 16];
        vlocal[id] += vlocal[id + 8];
        vlocal[id] += vlocal[id + 4];
        vlocal[id] += vlocal[id + 2];
        vlocal[id] += vlocal[id + 1];
    }

    if(id == 0) {
        variance_delta[filter] = local[0] * (-0.5f * powf(variance[filter] + .00001f, -1.5f));
    }
}