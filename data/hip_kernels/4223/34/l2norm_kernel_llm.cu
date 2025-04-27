#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial)
{
    // Optimize by using shared memory
    extern __shared__ float shared_sum[];

    int index = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (index >= N) return;

    int b = index / spatial;
    int i = index % spatial;
    int f;
    float sum = 0.0f;

    for(f = 0; f < filters; ++f) {
        int idx = b*filters*spatial + f*spatial + i;
        sum += x[idx] * x[idx];
    }

    // Use block-wise reduction for computing sum
    shared_sum[threadIdx.x] = sum;
    __syncthreads();

    sum = 0.0f;
    for(int j = 0; j < blockDim.x; ++j) {
        sum += shared_sum[j];
    }
    sum = sqrtf(sum);
    if(sum == 0) sum = 1;

    for(f = 0; f < filters; ++f) {
        int idx = b*filters*spatial + f*spatial + i;
        x[idx] /= sum;
        dx[idx] = (1 - x[idx]) / sum;
    }
}