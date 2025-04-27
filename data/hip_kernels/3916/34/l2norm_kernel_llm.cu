#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial)
{
    // Calculate the flat index and early return if out of bounds
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;
    
    // Use shared memory for intermediate sums within each warp
    extern __shared__ float shared_sum[];
    int b = index / spatial;
    int i = index % spatial;
    float sum = 0;

    // Compute sum of squares for each filter
    for (int f = 0; f < filters; ++f) {
        int idx = b * filters * spatial + f * spatial + i;
        sum += x[idx] * x[idx];
    }
    
    // Reduction within shared memory to calculate full sum
    shared_sum[threadIdx.x] = sum;
    __syncthreads();
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            shared_sum[threadIdx.x] += shared_sum[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Normalize and calculate dx only by the first thread in the block
    if (threadIdx.x == 0) {
        sum = sqrtf(shared_sum[0]);
        if (sum == 0) sum = 1;
    }
    __syncthreads();
    sum = shared_sum[0];
    
    for (int f = 0; f < filters; ++f) {
        int idx = b * filters * spatial + f * spatial + i;
        x[idx] /= sum;
        dx[idx] = (1 - x[idx]) / sum;
    }
}