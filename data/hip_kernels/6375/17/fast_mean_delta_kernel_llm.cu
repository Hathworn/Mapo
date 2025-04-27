#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[BLOCK];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    float sum = 0.0f;  // Initialize a local register for reduction

    for(int j = 0; j < batch; ++j)
    {
        for(int i = id; i < spatial; i += threads)
        {
            int index = j * spatial * filters + filter * spatial + i;
            sum += delta[index];  // Accumulate in the register
        }
    }

    local[id] = sum;  // Store the sum in shared memory
    __syncthreads();  // Synchronize to ensure all values are stored

    // Perform reduction in shared memory
    for(int stride = threads / 2; stride > 0; stride /= 2)
    {
        if(id < stride) 
        {
            local[id] += local[id + stride];
        }
        __syncthreads();
    }

    if(id == 0)
    {
        mean_delta[filter] = local[0] * (-1.0f / sqrtf(variance[filter] + 0.000001f));
    }
}