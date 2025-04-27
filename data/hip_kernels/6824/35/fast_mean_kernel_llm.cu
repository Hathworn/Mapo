#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    // Unroll the loop to improve memory access efficiency
    for(int j = 0; j < batch; ++j){
        for(int i = id; i < spatial; i += threads){
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += x[index];
        }
    }

    __syncthreads();

    // Use parallel reduction to sum local array
    if (id < warpSize)
    {
        for (int offset = warpSize; offset < threads; offset += warpSize)
        {
            local[id] += local[id + offset];
        }
    }

    __syncthreads();

    // Final reduction and writing result by a single thread
    if (id == 0)
    {
        float sum = 0;
        for (int i = 0; i < warpSize; ++i)
        {
            sum += local[i];
        }
        mean[filter] = sum / (spatial * batch);
    }
}