#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta) 
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    // Use shared memory to store precalculated values to reduce redundant calculation
    __shared__ float mean_shared, variance_shared;

    if (id == 0) {
        mean_shared = mean[filter];
        variance_shared = variance[filter];
    }
    __syncthreads();

    int i, j;
    for(j = 0; j < batch; ++j) {
        for(i = 0; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i + id;

            // Load values to avoid redundant access and perform calculation
            float x_val = (i + id < spatial) ? x[index] : 0;
            float delta_val = (i + id < spatial) ? delta[index] : 0;
            
            local[id] += delta_val * (x_val - mean_shared);
        }
    }
    __syncthreads();

    // Use atomic operation for reduction to enhance performance
    atomicAdd(&variance_delta[filter], local[id]);

    if(id == 0) {
        variance_delta[filter] *= -.5 * powf(variance_shared + .000001f, (float)(-3./2.));
    }
}