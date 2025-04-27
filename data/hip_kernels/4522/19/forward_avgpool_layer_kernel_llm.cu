#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    if (id >= n) return;

    // Improved index calculation
    int k = id % c;
    int b = id / c;

    int out_index = k + c * b;
    float sum = 0.0f;

    // Use shared memory to reduce redundant calculations and improve memory access patterns
    extern __shared__ float shared_input[];
    
    for (int i = threadIdx.y; i < w * h; i += blockDim.y) {
        int in_index = i + h * w * (k + b * c);
        shared_input[threadIdx.y] = input[in_index];
        __syncthreads();  // Synchronize to ensure shared memory is updated
        sum += shared_input[threadIdx.y];
    }
    
    __syncthreads();  // Synchronize before output assignment
    output[out_index] = sum / (w * h);
}