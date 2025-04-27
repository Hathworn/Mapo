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
    for(int j = 0; j < batch; ++j){
        for(int i = 0; i < spatial; i += threads){
            int index = j*spatial*filters + filter*spatial + i + id;

            // Use conditional increment to avoid branch divergence
            if(i+id < spatial) {
                local[id] += delta[index] * (x[index] - mean[filter]);
            }
        }
    }

    __syncthreads();

    // Reduce within the block using parallel reduction
    if (id < 32) {
        for (int offset = threads / 2; offset > 0; offset /= 2) {
            local[id] += __shfl_down_sync(0xffffffff, local[id], offset);
        }
    }

    if (id == 0) {
        variance_delta[filter] = local[0] * (-.5f) * powf(variance[filter] + .00001f, (float)(-3.f/2.f));
    }
}