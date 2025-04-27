#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    // Using shared memory for block-wise accumulation
    extern __shared__ float shared_data[];

    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int k = id % c;
    id /= c;
    int b = id;

    int tid = threadIdx.x;
    shared_data[tid] = 0;

    // Calculate pool region sum in parallel using block of threads
    for (int i = tid; i < w * h; i += blockDim.x) {
        int in_index = i + h * w * (k + b * c);
        shared_data[tid] += input[in_index];
    }

    // Sum reduction within block
    __syncthreads();
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            shared_data[tid] += shared_data[tid + stride];
        }
        __syncthreads();
    }

    // Write the result for this block to the output
    if (tid == 0) {
        output[k + c * b] = shared_data[0] / (w * h);
    }
}