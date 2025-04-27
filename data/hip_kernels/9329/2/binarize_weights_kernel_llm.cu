#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef CUDNN
#pragma comment(lib, "cudnn.lib")
#endif

extern "C" {
}

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (f >= n) return;

    float mean = 0.0f;
    // Use shared memory to reduce global memory accesses
    extern __shared__ float shared_weights[];
    
    // Load weights into shared memory
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        shared_weights[i] = fabs(weights[f*size + i]);
    }
    __syncthreads();

    // Compute the mean using a single loop
    for (int i = 0; i < size; ++i) {
        mean += shared_weights[i];
    }
    mean /= size;

    // Binarize weights in parallel
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f*size + i] = (weights[f*size + i] > 0) ? mean : -mean;
    }
}