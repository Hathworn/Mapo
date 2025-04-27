#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_histo_kernel_shared(u_char* Source, int *res, unsigned height, unsigned width) {
    __shared__ int hist[256];

    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    int index = threadIdx.y * blockDim.x + threadIdx.x;  // Correct indexing for 2D threads

    // Initialize shared histogram to zero
    if (index < 256) {
        hist[index] = 0;
    }
    __syncthreads();

    // Ensure the thread is within bounds
    if (i < height && j < width) {
        atomicAdd(&hist[Source[i * width + j]], 1);
    }
    __syncthreads();

    // Accumulate histogram to global memory
    if (index < 256) {
        atomicAdd(&res[index], hist[index]);
    }
}