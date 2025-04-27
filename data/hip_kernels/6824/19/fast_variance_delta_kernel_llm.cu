#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    // Unroll loop to improve performance
    int spatial_iterations = spatial / threads;
    int remainder = spatial % threads;
    
    int j, i;
    for(j = 0; j < batch; ++j){
        for(i = 0; i < spatial_iterations * threads; i += threads){
            int index = j * spatial * filters + filter * spatial + i + id;
            local[id] += delta[index] * (x[index] - mean[filter]);
        }
        // Handle remainder spatial elements
        if (id < remainder) {
            int index = j * spatial * filters + filter * spatial + spatial_iterations * threads + id;
            local[id] += delta[index] * (x[index] - mean[filter]);
        }
    }

    __syncthreads();

    // Use atomicAdd for better parallel reduction
    if (id == 0) {
        variance_delta[filter] = 0;
    }
    atomicAdd(&variance_delta[filter], local[id]);
    __syncthreads();

    if(id == 0){
        variance_delta[filter] *= -.5f * powf(variance[filter] + .00001f, (float)(-3.f/2.f));
    }
}