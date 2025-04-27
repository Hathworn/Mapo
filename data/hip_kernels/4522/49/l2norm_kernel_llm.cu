#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial) 
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplify index calculation
    if (index >= N) return;

    int b = index / spatial;
    int i = index % spatial;
    float sum = 0;

    // Use shared memory for reduction
    extern __shared__ float shared_sum[];

    // Accumulate sum in shared memory
    for (int f = threadIdx.x; f < filters; f += blockDim.x) {
        int idx = b * filters * spatial + f * spatial + i;
        sum += x[idx] * x[idx];
    }

    shared_sum[threadIdx.x] = sum;
    __syncthreads();
    
    // Reduce sum within block
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            shared_sum[threadIdx.x] += shared_sum[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Final reduction and normalization
    if (threadIdx.x == 0) {
        sum = sqrtf(shared_sum[0]);
        if (sum == 0) sum = 1;
        shared_sum[0] = sum;
    }
    __syncthreads();

    sum = shared_sum[0];

    // Normalize and calculate dx
    for (int f = threadIdx.x; f < filters; f += blockDim.x) {
        int idx = b * filters * spatial + f * spatial + i;
        x[idx] /= sum;
        dx[idx] = (1 - x[idx]) / sum;
    }
}