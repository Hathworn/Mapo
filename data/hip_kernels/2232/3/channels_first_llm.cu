#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void channels_first(float* input, float* rinput, int channels, int height, int width, int pad_size)
{
    // Use shared memory for better memory access pattern if needed
    __shared__ float shared_mem[THREADS_PER_BLOCK];

    // Calculate the global position
    int n = blockIdx.x;
    int y = blockIdx.y;
    int x = blockIdx.z;
    int ch_off = threadIdx.x;

    // Compute dimensions
    int dimcyx = channels * height * width;
    int dimyx = height * width;
    int p_dimx = (width + 2 * pad_size);
    int p_dimy = (height + 2 * pad_size);
    int p_dimyxc = channels * p_dimy * p_dimx;
    int p_dimxc = p_dimx * channels;

    // Calculate input and rinput offsets
    int input_offset = n * dimcyx + y * width + x;
    int rinput_offset = n * p_dimyxc + (y + pad_size) * p_dimxc + (x + pad_size) * channels;

    // Unroll loop if possible for better performance
    for (int c = ch_off; c < channels; c += THREADS_PER_BLOCK) {
        // Use shared memory if accessed multiple times
        shared_mem[ch_off] = input[input_offset + c * dimyx];
        __syncthreads(); // Synchronize threads if necessary

        rinput[rinput_offset + c] = shared_mem[ch_off];
    }
}