#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial)
{
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (index >= N) return;

    int b = index / spatial;  // Batch index
    int i = index % spatial;  // Spatial index
    float sum = 0;

    // Unrolling filter loop for efficiency
    int f;
    for (f = 0; f < filters; f += 4) {
        int index_base = b * filters * spatial + i;  // Base index for this batch and spatial
        if(f + 0 < filters) {
            int idx0 = index_base + (f + 0) * spatial;
            sum += x[idx0] * x[idx0];
        }
        if(f + 1 < filters) {
            int idx1 = index_base + (f + 1) * spatial;
            sum += x[idx1] * x[idx1];
        }
        if(f + 2 < filters) {
            int idx2 = index_base + (f + 2) * spatial;
            sum += x[idx2] * x[idx2];
        }
        if(f + 3 < filters) {
            int idx3 = index_base + (f + 3) * spatial;
            sum += x[idx3] * x[idx3];
        }
    }

    sum = sqrtf(sum);
    if (sum == 0) sum = 1;

    for (f = 0; f < filters; ++f) {
        int index = b * filters * spatial + f * spatial + i;
        x[index] /= sum;
        dx[index] = (1 - x[index]) / sum;
    }
}