#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;

    int b = index / spatial;
    int i = index % spatial;

    float sum = 0;
    for (int f = 0; f < filters; ++f) {
        int linear_index = b * filters * spatial + f * spatial + i;
        sum += x[linear_index] * x[linear_index];  // Simplified sum calculation
    }
    
    sum = sqrtf(sum);
    sum = fmaxf(sum, 1.0f);  // Ensure sum is not zero

    for (int f = 0; f < filters; ++f) {
        int linear_index = b * filters * spatial + f * spatial + i;
        x[linear_index] /= sum;  // Normalize
        dx[linear_index] = (1.0f - x[linear_index]) / sum;  // Calculate dx
    }
}