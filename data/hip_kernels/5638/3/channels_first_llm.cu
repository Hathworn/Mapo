#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void channels_first(float* input, float* rinput, int channels, int height, int width, int pad_size)
{
    // Calculate indices
    int n = blockIdx.x;
    int y = blockIdx.y;
    int x = blockIdx.z;
    int ch_off = threadIdx.x;

    // Precompute dimensions
    int dimcyx = channels * height * width;
    int dimyx = height * width;
    int p_dimx = (width + 2 * pad_size);
    int p_dimy = (height + 2 * pad_size);
    int p_dimyxc = channels * p_dimy * p_dimx;
    int p_dimxc = p_dimx * channels;

    // Use shared memory to reduce global memory access
    __shared__ float smem[THREADS_PER_BLOCK];

    for (int c = ch_off; c < channels; c += THREADS_PER_BLOCK) {
        smem[threadIdx.x] = input[n * dimcyx + c * dimyx + y * width + x];  // Load into shared memory
        __syncthreads(); // Synchronize to ensure all threads have written to shared memory 

        rinput[n * p_dimyxc + (y + pad_size) * p_dimxc + (x + pad_size) * channels + c] = smem[threadIdx.x];  // Store from shared memory to output
        __syncthreads(); // Ensure the shared memory copy is complete before the next iteration
    }
}