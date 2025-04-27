#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_filters_kernel(float *filters, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x;
    if (f >= n) return;

    // Reduce accesses by caching in shared memory
    __shared__ float shared_filters[1024];

    // Load data into shared memory
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        shared_filters[i] = abs(filters[f * size + i]);
    }
    __syncthreads();

    // Calculate mean with reduction
    float mean = 0;
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        mean += shared_filters[i];
    }
    mean /= size;
    __syncthreads();

    // Binarize filters
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f * size + i] = (filters[f * size + i] > 0) ? mean : -mean;
    }
}