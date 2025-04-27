#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;

    // Finding the largest element in the input using parallel reduction
    for (i = 0; i < n; ++i) {
        float val = input[i * stride];
        largest = (val > largest) ? val : largest;
    }

    for (i = 0; i < n; ++i) {
        float e = expf((input[i * stride] - largest) / temp);
        sum += e;
        output[i * stride] = e;
    }

    // Normalize the outputs
    for (i = 0; i < n; ++i) {
        output[i * stride] /= sum;
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride_grid = blockDim.x * gridDim.x;
    
    // Using grid-stride loop for kernel launch optimization
    for (int tid = id; tid < batch * groups; tid += stride_grid) {
        int b = tid / groups;
        int g = tid % groups;
        softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
    }
}