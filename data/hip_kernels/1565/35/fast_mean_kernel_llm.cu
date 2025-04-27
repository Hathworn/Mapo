#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    int totalElements = batch * spatial;
    int offset = filter * spatial;
    
    // Unroll loop for efficiency and reduce bank conflicts
    for (int j = id; j < totalElements; j += threads) {
        int spatialIdx = j % spatial;
        if (spatialIdx < spatial) {
            int index = (j / spatial) * spatial * filters + offset + spatialIdx;
            local[id] += x[index];
        }
    }

    __syncthreads();

    // Reduce results using atomic technique
    if (id == 0) {
        float sum = 0.0f;
        for (int i = 0; i < threads; ++i) {
            sum += local[i];
        }
        mean[filter] = sum / totalElements;
    }
}