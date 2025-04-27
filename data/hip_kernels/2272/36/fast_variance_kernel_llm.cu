#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void  fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    local[id] = 0.0f;

    // Use a single loop with grid-stride to increment index
    for (int j = 0; j < batch * spatial; j += threads * gridDim.x) {
        int index = j + blockDim.x * blockIdx.x + id;
        if (index < batch * spatial) {
            int offset = (index / spatial) * spatial * filters + filter * spatial + (index % spatial);
            local[id] += powf(x[offset] - mean[filter], 2);
        }
    }

    __syncthreads();

    // Use parallel reduction to improve performance
    for (int stride = threads / 2; stride > 0; stride >>= 1) {
        if (id < stride) {
            local[id] += local[id + stride];
        }
        __syncthreads();
    }

    if (id == 0) {
        variance[filter] = local[0] / (spatial * batch - 1);
    }
}