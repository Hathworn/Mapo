#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (f >= n) return;

    // Use shared memory to reduce global memory access latency
    extern __shared__ float shared_weights[];
    
    float mean = 0;
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        shared_weights[threadIdx.x] = fabsf(weights[f*size + i]);
        __syncthreads(); 
        mean += shared_weights[threadIdx.x];
        __syncthreads();
    }
    
    // Calculate mean in parallel
    mean = mean / size;
    
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        shared_weights[threadIdx.x] = weights[f*size + i];
        __syncthreads();
        binary[f*size + i] = (shared_weights[threadIdx.x] > 0) ? mean : -mean;
        __syncthreads();
    }
}