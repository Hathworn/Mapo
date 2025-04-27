#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (s >= size) return;
    
    // Use shared memory to reduce global memory accesses
    extern __shared__ float shared_mean[];
    float mean = 0;

    for (int i = 0; i < n; ++i) {
        mean += fabsf(input[i * size + s]);
    }
    mean = mean / n;
    shared_mean[threadIdx.x] = mean;

    __syncthreads();

    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? shared_mean[threadIdx.x] : -shared_mean[threadIdx.x];
    }
}