#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int b = id / c;
    int k = id % c;
    int out_index = k + c * b;

    // Utilizing shared memory for better performance
    extern __shared__ float temp[];
    temp[threadIdx.x] = 0;

    for(int i = threadIdx.x; i < w*h; i += blockDim.x) {
        int in_index = i + h*w*(k + b*c);
        temp[threadIdx.x] += input[in_index];
    }
    __syncthreads();

    // Perform reduction within a block
    if (threadIdx.x == 0) {
        float sum = 0;
        for (int i = 0; i < blockDim.x; ++i) {
            sum += temp[i];
        }
        output[out_index] = sum / (w * h);
    }
}