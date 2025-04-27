#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    // Initialize shared memory
    local[id] = 0;

    // Loop unrolling - process multiple elements per thread to improve efficiency
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            if (i < spatial) {
                local[id] += delta[index] * (x[index] - mean[filter]);
            }
        }
    }

    // Sum reduction within block
    __syncthreads();
    
    if (threads >= 1024) { if (id < 512) { local[id] += local[id + 512]; } __syncthreads(); }
    if (threads >= 512) { if (id < 256) { local[id] += local[id + 256]; } __syncthreads(); }
    if (threads >= 256) { if (id < 128) { local[id] += local[id + 128]; } __syncthreads(); }
    if (threads >= 128) { if (id < 64) { local[id] += local[id + 64]; } __syncthreads(); }
    
    if (id < 32) {
        volatile float* vlocal = local; // Avoid register spill
        if (threads >= 64) vlocal[id] += vlocal[id + 32];
        if (threads >= 32) vlocal[id] += vlocal[id + 16];
        if (threads >= 16) vlocal[id] += vlocal[id + 8];
        if (threads >= 8) vlocal[id] += vlocal[id + 4];
        if (threads >= 4) vlocal[id] += vlocal[id + 2];
        if (threads >= 2) vlocal[id] += vlocal[id + 1];
    }

    // Final result stored by first thread
    if (id == 0) {
        variance_delta[filter] = local[0] * -.5f * powf(variance[filter] + .00001f, -1.5f);
    }
}