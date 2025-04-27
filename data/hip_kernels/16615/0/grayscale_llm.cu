#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void grayscale(unsigned char * data_rgb, unsigned char * data_gray, std::size_t rows, std::size_t cols)
{
    // Use shared memory to reduce global memory accesses
    extern __shared__ unsigned char shared_rgb[];

    auto i = blockIdx.x * blockDim.x + threadIdx.x;
    auto j = blockIdx.y * blockDim.y + threadIdx.y;

    // Linear index for the current thread within the block
    int localIdx = threadIdx.y * blockDim.x + threadIdx.x;

    // Load RGB data into shared memory
    if (i < cols && j < rows) {
        shared_rgb[3 * localIdx] = data_rgb[3 * (j * cols + i)];
        shared_rgb[3 * localIdx + 1] = data_rgb[3 * (j * cols + i) + 1];
        shared_rgb[3 * localIdx + 2] = data_rgb[3 * (j * cols + i) + 2];
        __syncthreads(); // Synchronize to ensure all threads have loaded their data

        // Compute grayscale value using loaded shared memory
        data_gray[j * cols + i] = (
            307 * shared_rgb[3 * localIdx] + 
            604 * shared_rgb[3 * localIdx + 1] + 
            113 * shared_rgb[3 * localIdx + 2]
        ) / 1024;
    }
}