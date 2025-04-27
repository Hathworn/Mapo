#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;
    int stride = blockDim.x * gridDim.x;  // Use grid-stride loop for parallelization

    for(int j = 0; j < batch; ++j) {
        for(int i = id; i < spatial; i += stride) {  // Use grid-stride loop
            int index = j*spatial*filters + filter*spatial + i;
            local[id] += delta[index];
        }
    }

    __syncthreads();

    // Use reduction to sum values in shared memory
    for(int stride = threads / 2; stride > 0; stride /= 2) {
        if(id < stride) {
            local[id] += local[id + stride];
        }
        __syncthreads();
    }

    // Store the result in global memory from the first thread
    if(id == 0) {
        mean_delta[filter] = local[0] * (-1.f/sqrtf(variance[filter] + .00001f));
    }
}