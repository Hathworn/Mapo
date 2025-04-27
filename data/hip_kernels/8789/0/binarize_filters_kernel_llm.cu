#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_filters_kernel(float *filters, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x;
    if (f >= n) return;

    float mean = 0.0f;

    // Use shared memory to reduce global memory access
    extern __shared__ float shared_memory[];
    float *local_filters = shared_memory;

    // Load data into shared memory
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        local_filters[i] = abs(filters[f * size + i]);
    }
    __syncthreads();

    // Accumulate sum in shared memory
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        mean += local_filters[i];
    }
   __syncthreads();
   
    // Calculate the mean
    if (threadIdx.x == 0) {
        for (int i = 1; i < blockDim.x; i++) {
            mean += local_filters[i];
        }
        mean /= size;
    }
    __syncthreads();

    // Binarization
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f * size + i] = (filters[f * size + i] > 0) ? mean : -mean;
    }
}