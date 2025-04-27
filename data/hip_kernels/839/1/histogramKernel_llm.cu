#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized histogram kernel
__global__ void histogramKernel(unsigned char* image, long img_size, unsigned int* histogram, int hist_size) {
    extern __shared__ unsigned int temp_hist[]; // Shared memory for partial histograms
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Initialize shared memory
    for (int i = threadIdx.x; i < hist_size; i += blockDim.x)
        temp_hist[i] = 0;
    __syncthreads();

    // Populate shared memory histogram
    for (int i = tid; i < img_size; i += stride)
        atomicAdd(&temp_hist[image[i]], 1);
    __syncthreads();

    // Combine partial histograms into global memory
    for (int i = threadIdx.x; i < hist_size; i += blockDim.x)
        atomicAdd(&histogram[i], temp_hist[i]);
}