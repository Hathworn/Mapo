#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial)
{
    int index = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (index >= N) return;
    int b = index / spatial;
    int i = index % spatial;
    
    float sum = 0.0f;

    // Unroll loop for parallel reduction and efficiency
    for (int f = 0; f < filters; ++f) {
        int idx = b*filters*spatial + f*spatial + i;
        sum += x[idx] * x[idx];
    }

    sum = sqrtf(sum);
    if (sum == 0.0f) sum = 1.0f;

    for (int f = 0; f < filters; ++f) {
        int idx = b*filters*spatial + f*spatial + i;
        x[idx] /= sum;
        dx[idx] = (1.0f - x[idx]) / sum;
    }
}