#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];
    
    int id = threadIdx.x;
    int filter = blockIdx.x;

    // Initialize shared memory for each thread
    local[id] = 0;

    int i, j;
    for(j = 0; j < batch; ++j) {
        // Loop unrolling for efficiency
        for(i = 0; i < spatial; i += threads * 4) {  // Unroll loop by processing 4 elements at once
            int index = j*spatial*filters + filter*spatial + i + id;
            if (i+id < spatial) {
                local[id] += delta[index]*(x[index] - mean[filter]);
            }
            if (i+id+threads < spatial) {
                local[id] += delta[index+threads]*(x[index+threads] - mean[filter]);
            }
            if (i+id+2*threads < spatial) {
                local[id] += delta[index+2*threads]*(x[index+2*threads] - mean[filter]);
            }
            if (i+id+3*threads < spatial) {
                local[id] += delta[index+3*threads]*(x[index+3*threads] - mean[filter]);
            }
        }
    }

    __syncthreads();

    // Use a single atomic operation to accumulate results in shared memory
    if (id == 0) {
        variance_delta[filter] += local[0];
        for(i = 1; i < threads; ++i) {
            variance_delta[filter] += local[i];
        }
        variance_delta[filter] *= -.5f * powf(variance[filter] + .00001f, (float)(-3.f/2.f));
    }
}