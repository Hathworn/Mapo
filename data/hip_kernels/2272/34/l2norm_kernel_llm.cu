#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride for loop unrolling.

    for (int idx = index; idx < N; idx += stride) { // Use stride to process multiple elements per thread.
        int b = idx / spatial;
        int i = idx % spatial;
        float sum = 0;
        
        // Compute l2norm for this segment of the batch.
        for(int f = 0; f < filters; ++f) {
            int index_f = b * filters * spatial + f * spatial + i;
            sum += powf(x[index_f], 2);
        }
        sum = sqrtf(sum);
        if (sum == 0) sum = 1;

        // Normalize input and compute derivative for each filter.
        for(int f = 0; f < filters; ++f) {
            int index_f = b * filters * spatial + f * spatial + i;
            x[index_f] /= sum;
            dx[index_f] = (1 - x[index_f]) / sum;
        }
    }
}