#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial)
{
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (index >= N) return;
    
    int b = index / spatial;
    int i = index % spatial;
    int f;
    float sum = 0;

    // Pre-calculated base index
    int base_index = b * filters * spatial + i;

    for(f = 0; f < filters; ++f) {
        sum += powf(x[base_index + f * spatial], 2);
    }

    sum = sqrtf(sum);
    if(sum == 0) sum = 1;

    for(f = 0; f < filters; ++f) {
        int idx = base_index + f * spatial;  // Use pre-calculated index
        x[idx] /= sum;
        dx[idx] = (1 - x[idx]) / sum;
    }
}