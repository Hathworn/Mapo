#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK 256 // Ensure this is defined

__global__ void channels_first(float* input, float* rinput, int channels, int height, int width, int pad_size) {
    // n (batch size), y (height), x (width)
    int n = blockIdx.x;
    int y = blockIdx.y;
    int x = blockIdx.z;

    int ch_off = threadIdx.x;

    // Pre-compute reused variables
    int dimcyx = channels * height * width;
    int dimyx = height * width;
    int p_dimx = (width + 2 * pad_size);
    int p_dimy = (height + 2 * pad_size);
    int p_dimyxc = channels * p_dimy * p_dimx;
    int p_dimxc = p_dimx * channels;

    // Use shared memory for block-level data reuse
    __shared__ float sharedInput[THREADS_PER_BLOCK];

    for (int c = ch_off; c < channels; c += THREADS_PER_BLOCK) {
        // Efficient memory access with coalesced reads
        sharedInput[threadIdx.x] = input[n * dimcyx + c * dimyx + y * width + x];

        // Wait for all threads to load necessary data
        __syncthreads();

        // Store results utilizing shared memory for optimal write pattern
        rinput[n * p_dimyxc + (y + pad_size) * p_dimxc + (x + pad_size) * channels + c] = sharedInput[threadIdx.x];

        // Ensure all writes are completed before next iteration
        __syncthreads();
    }
}