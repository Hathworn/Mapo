#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    local[id] = 0.0f;

    // Process elements in a coalesced manner
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {  // Use thread stride loop
            int index = j * spatial * filters + filter * spatial + i;
            float diff = x[index] - mean[filter];
            local[id] += diff * diff;
        }
    }
    
    __syncthreads();

    // Use reduction to sum results within a block
    if(id < 32) {
        for (int offset = threads / 2; offset > 0; offset >>= 1) {
            if(id < offset) {
                local[id] += local[id + offset];
            }
            __syncthreads();  // Ensure all writes to local complete
        }
    }

    // Store final sum into variance
    if (id == 0) {
        variance[filter] = local[0] / (spatial * batch - 1);
    }
}