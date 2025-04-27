#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void channels_first(float* input, float* rinput, int channels, int height, int width, int pad_size)
{
    // Use shared memory for faster access
    __shared__ float tile[THREADS_PER_BLOCK];

    int n = blockIdx.x;
    int y = blockIdx.y;
    int x = blockIdx.z;

    int ch_off = threadIdx.x;

    int dimcyx = channels * height * width;
    int dimyx = height * width;

    int p_dimx = (width + 2 * pad_size);
    int p_dimy = (height + 2 * pad_size);
    int p_dimyxc = channels * p_dimy * p_dimx;
    int p_dimxc = p_dimx * channels;

    int input_idx, rinput_idx;

    // Stride over channels
    for (int c = ch_off; c < channels; c += THREADS_PER_BLOCK) {
        input_idx = n * dimcyx + c * dimyx + y * width + x;
        // Load into shared memory
        tile[threadIdx.x] = input[input_idx];
        __syncthreads();  // Ensure all threads have loaded their values
        rinput_idx = n * p_dimyxc + (y + pad_size) * p_dimxc + (x + pad_size) * channels + c;
        // Store from shared memory
        rinput[rinput_idx] = tile[threadIdx.x];
        __syncthreads();  // Ensure all threads have read their values
    }
}