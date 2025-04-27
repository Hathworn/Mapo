#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    // Use a single loop to reduce index computation overhead
    int total_spatial = spatial * batch;
    for (int index = id; index < total_spatial; index += threads) {
        int j = index / spatial;
        int i = index % spatial;
        int offset = j * spatial * filters + filter * spatial + i;
        local[id] += x[offset];
    }

    __syncthreads();

    // Use parallel reduction for sum
    if (threads >= 1024) { if (id < 512) { local[id] += local[id + 512]; } __syncthreads(); }
    if (threads >= 512)  { if (id < 256) { local[id] += local[id + 256]; } __syncthreads(); }
    if (threads >= 256)  { if (id < 128) { local[id] += local[id + 128]; } __syncthreads(); }
    if (threads >= 128)  { if (id < 64)  { local[id] += local[id + 64];  } __syncthreads(); }
    if (id < 32) {
        if (threads >= 64) local[id] += local[id + 32];
        local[id] += local[id + 16];
        local[id] += local[id + 8];
        local[id] += local[id + 4];
        local[id] += local[id + 2];
        local[id] += local[id + 1];
    }

    if (id == 0) {
        mean[filter] = local[0] / total_spatial;
    }
}