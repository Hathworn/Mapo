#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_forward_softmax_layer_kernel(int n, int batch, float *input, float *output) {
    // Using shared memory for intermediate computations
    extern __shared__ float shared_mem[];

    int tid = threadIdx.x;
    int b = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + tid;

    if (b >= batch) {
        return;
    }

    // Calculate maxf using a single loop
    float maxf = -INFINITY;
    for (int i = tid; i < n; i += blockDim.x) {
        float val = input[i + b * n];
        if (val > maxf) {
            maxf = val;
        }
    }

    // Reduce maxf across the block
    shared_mem[tid] = maxf;
    __syncthreads();

    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            shared_mem[tid] = fmaxf(shared_mem[tid], shared_mem[tid + s]);
        }
        __syncthreads();
    }
    maxf = shared_mem[0];

    // Calculate sum exponential
    float sum = 0.f;
    for (int i = tid; i < n; i += blockDim.x) {
        sum += expf(input[i + b * n] - maxf);
    }

    // Reduce sum
    shared_mem[tid] = sum;
    __syncthreads();

    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            shared_mem[tid] += shared_mem[tid + s];
        }
        __syncthreads();
    }
    sum = shared_mem[0];

    sum = (sum != 0) ? maxf + logf(sum) : maxf - 100.f;

    // Write output
    for (int i = tid; i < n; i += blockDim.x) {
        output[i + b * n] = expf(input[i + b * n] - sum);
    }
}