#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (s >= size) return;

    // Use shared memory to reduce global memory accesses
    extern __shared__ float shared_data[];
    
    float sum = 0;
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        sum += abs(input[i * size + s]);
    }
    shared_data[threadIdx.x] = sum;
    __syncthreads();

    // Reduction in shared memory to calculate mean
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (threadIdx.x < stride) {
            shared_data[threadIdx.x] += shared_data[threadIdx.x + stride];
        }
        __syncthreads();
    }

    float mean = shared_data[0] / n;
    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}