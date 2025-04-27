#include "hip/hip_runtime.h"
#include "includes.h"
__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    // Shared memory for intermediate calculations
    extern __shared__ float shared_data[];

    int tid = threadIdx.x;
    float* sdata = shared_data + tid * n;

    // Load data into shared memory
    float sum = 0;
    float largest = -INFINITY;
    for (int i = 0; i < n; ++i) {
        sdata[i] = input[i * stride];
        largest = (sdata[i] > largest) ? sdata[i] : largest;
    }
    __syncthreads();

    // Calculate exp and sum
    for (int i = 0; i < n; ++i) {
        float e = expf(sdata[i] / temp - largest / temp);
        sum += e;
        output[i * stride] = e;
    }
    __syncthreads();

    // Normalize the results
    for (int i = 0; i < n; ++i) {
        output[i * stride] /= sum;
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= batch * groups) return;
    int b = id / groups;
    int g = id % groups;

    // Launch device function with allocated shared memory
    softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}