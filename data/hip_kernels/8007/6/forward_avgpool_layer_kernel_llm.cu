#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    // Using shared memory for partial sums
    __shared__ float partial_sum[1024];

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int tid = threadIdx.x;
    if(id >= n) return;

    int k = id % c;
    int b = id / c;

    int in_index_base = h * w * (k + b * c);
    float sum = 0.0f;

    for(int i = tid; i < w * h; i += blockDim.x){
        sum += input[in_index_base + i];
    }

    partial_sum[tid] = sum;
    __syncthreads();

    // Reduce partial sums within the block
    for(int stride = 1; stride < blockDim.x; stride *= 2) {
        if (tid % (2 * stride) == 0 && tid + stride < w * h) {
            partial_sum[tid] += partial_sum[tid + stride];
        }
        __syncthreads();
    }

    if(tid == 0) {
        output[k + c * b] = partial_sum[0] / (w * h);
    }
}