#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    // Using flat thread index for better coalescence
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Calculate output index
    int k = id % c;
    int b = id / c;
    int out_index = k + c * b;

    // Initialize output accumulator
    float sum = 0.0f;

    // Use threadIdx.x to offset contributions, loop unroll for performance
    for (int i = threadIdx.x; i < w * h; i += blockDim.x) {
        int in_index = i + h * w * (k + b * c);
        sum += input[in_index];
    }

    // Use shared memory for reduction if blockDim.x > 1
    __shared__ float shared_sum[1024]; // Support up to 1024 threads per block
    shared_sum[threadIdx.x] = sum;
    __syncthreads();

    // Reduction step
    if (threadIdx.x == 0) {
        float total_sum = 0.0f;
        for (int j = 0; j < blockDim.x; ++j) {
            total_sum += shared_sum[j];
        }
        output[out_index] = total_sum / (w * h);
    }
}