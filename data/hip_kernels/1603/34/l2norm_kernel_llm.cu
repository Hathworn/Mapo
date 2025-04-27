#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial)
{
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (index >= N) return;

    int b = index / spatial;
    int i = index % spatial;

    // Allocate shared memory to store sum for spatial block
    extern __shared__ float shared_sum[];
    int thread_id = threadIdx.x;
    shared_sum[thread_id] = 0;

    // Calculate the sum of squares using shared memory for improved efficiency
    for (int f = 0; f < filters; ++f) {
        int index = b * filters * spatial + f * spatial + i;
        shared_sum[thread_id] += powf(x[index], 2);
    }

    __syncthreads();

    // Reduce the sum within the block
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (thread_id < stride) {
            shared_sum[thread_id] += shared_sum[thread_id + stride];
        }
        __syncthreads();
    }

    float sum = sqrtf(shared_sum[0]);
    if (sum == 0) sum = 1;

    // Normalize using the computed sum
    for (int f = 0; f < filters; ++f) {
        int index = b * filters * spatial + f * spatial + i;
        x[index] /= sum;
        dx[index] = (1 - x[index]) / sum;
    }
}