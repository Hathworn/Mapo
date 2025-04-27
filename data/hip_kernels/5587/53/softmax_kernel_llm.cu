#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    extern __shared__ float shared[];  // Use shared memory for efficiency
    float* shared_output = shared;
    float sum = 0;
    float largest = -INFINITY;

    // Collaborative loading of data into shared memory
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        float val = input[i * stride];
        shared_output[i] = val;
        atomicMax(&largest, val); // Determine largest value
    }
    __syncthreads();

    // Compute exponentials and store in shared memory
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        shared_output[i] = expf((shared_output[i] - largest) / temp);
        atomicAdd(&sum, shared_output[i]); // Sum up the exponentials
    }
    __syncthreads();

    // Normalize the output values
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        output[i * stride] = shared_output[i] / sum;
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= batch * groups) return;

    int b = id / groups;
    int g = id % groups;
    softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}