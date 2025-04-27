#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial)
{
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;
    
    // Calculate the batch and spatial index
    int b = index / spatial;
    int i = index % spatial;
    float sum = 0.0f;

    // Use shared memory for partial sum to reduce global memory accesses
    extern __shared__ float sdata[];
    for (int f = threadIdx.x; f < filters; f += blockDim.x) {
        int idx = b * filters * spatial + f * spatial + i;
        atomicAdd(&sdata[threadIdx.x], powf(x[idx], 2));
    }

    // Block-wide reduction for sum to calculate l2 norm
    __syncthreads();
    if (threadIdx.x == 0) {
        for (int j = 1; j < blockDim.x; j++) {
            sum += sdata[j];
        }
        sum = sqrtf(sum);
        if (sum == 0) sum = 1.0f;
    }
    __syncthreads();

    // Normalize x and compute dx using the l2 norm
    for (int f = threadIdx.x; f < filters; f += blockDim.x) {
        int idx = b * filters * spatial + f * spatial + i;
        x[idx] /= sum;
        dx[idx] = (1 - x[idx]) / sum;
    }
}