#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void channels_first(float* input, float* rinput, int channels, int height, int width, int pad_size)
{
    // Optimize calculation by using shared memory and fewer instructions
    int n = blockIdx.x;
    int y = blockIdx.y;
    int x = blockIdx.z;

    int ch_off = threadIdx.x;

    __shared__ float shared_input[THREADS_PER_BLOCK];

    int dimyx = height * width;
    int p_dimx = (width + 2 * pad_size);
    int p_dimy = (height + 2 * pad_size);
    int p_dimyxc = channels * p_dimy * p_dimx;
    int p_dimxc = p_dimx * channels;
    int offset_input = n * channels * dimyx + y * width + x;
    int offset_rinput = n * p_dimyxc + (y + pad_size) * p_dimxc + (x + pad_size) * channels;

    for (int c = ch_off; c < channels; c += THREADS_PER_BLOCK) {
        // Load input data into shared memory for coalescing
        shared_input[threadIdx.x] = input[offset_input + c * dimyx];
        __syncthreads();

        // Write data from shared memory to the output
        rinput[offset_rinput + c] = shared_input[threadIdx.x];
        __syncthreads();
    }
}