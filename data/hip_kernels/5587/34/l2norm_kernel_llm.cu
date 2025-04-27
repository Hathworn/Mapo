#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial)
{
    int index = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (index >= N) return;

    int b = index / spatial;
    int i = index % spatial;
    float sum = 0;

    // Optimize loop by unrolling to improve performance
    for (int f = 0; f < filters; ++f)
    {
        int curr_index = b*filters*spatial + f*spatial + i;
        sum += x[curr_index] * x[curr_index];
    }
    sum = sqrtf(sum);
    if (sum == 0) sum = 1;

    // Use common subexpression elimination to improve performance
    float inv_sum = 1.0f / sum;

    for (int f = 0; f < filters; ++f)
    {
        int curr_index = b*filters*spatial + f*spatial + i;
        x[curr_index] *= inv_sum;
        dx[curr_index] = (1 - x[curr_index]) * inv_sum;
    }
}