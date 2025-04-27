#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    float sum = 0;

    // Loop unrolling for better performance
    for (int j = 0; j < batch; ++j){
        int index = j * spatial * filters + filter * spatial + id;
        for (int i = 0; i < spatial; i += threads) {
            if (i + id < spatial)
                sum += delta[index + i];
        }
    }
    local[id] = sum;

    __syncthreads();  // Ensure all additions are complete

    // Use reduction to sum in shared memory
    if (threads >= 1024) { if (id < 512) local[id] += local[id + 512]; __syncthreads(); }
    if (threads >= 512) { if (id < 256) local[id] += local[id + 256]; __syncthreads(); }
    if (threads >= 256) { if (id < 128) local[id] += local[id + 128]; __syncthreads(); }
    if (threads >= 128) { if (id < 64) local[id] += local[id + 64]; __syncthreads(); }
    
    // Final reduction
    if (id < 32) {
        volatile float* vlocal = local;
        vlocal[id] += vlocal[id + 32];
        vlocal[id] += vlocal[id + 16];
        vlocal[id] += vlocal[id + 8];
        vlocal[id] += vlocal[id + 4];
        vlocal[id] += vlocal[id + 2];
        vlocal[id] += vlocal[id + 1];
    }

    if (id == 0) {
        mean_delta[filter] = local[0] * (-1. / sqrt(variance[filter] + .000001f));
    }
}