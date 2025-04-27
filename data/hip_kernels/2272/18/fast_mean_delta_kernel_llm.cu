#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;

    int filter = blockIdx.x;
    local[id] = 0.0f;

    // Unroll spatial loop by half to optimize memory access
    for(int j = 0; j < batch; ++j){
        for(int i = id; i < spatial; i += 2 * threads){
            int index1 = j * spatial * filters + filter * spatial + i;
            int index2 = index1 + threads;

            local[id] += delta[index1];
            
            if(i + threads < spatial) {
                local[id] += delta[index2];
            }
        }
    }

    __syncthreads();

    // Parallel reduction to accumulate partial sums in shared memory
    for (int s = threads / 2; s > 0; s >>= 1) {
        if (id < s) {
            local[id] += local[id + s];
        }
        __syncthreads();
    }

    if (id == 0) {
        mean_delta[filter] = local[0] * (-1.f / sqrtf(variance[filter] + .00001f));
    }
}