#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void channels_first(float* input, float* rinput, int channels, int height, int width, int pad_size)
{
    // Combined block and thread indexing to improve access pattern
    int n = blockIdx.x;
    int y = blockIdx.y * blockDim.x + threadIdx.x;

    if (y >= height) return; // Avoid accessing out-of-bound elements

    int x = blockIdx.z;
    int dimcyx = channels * height * width;
    int dimyx = height * width;

    int p_dimx = (width + 2 * pad_size);
    int p_dimy = (height + 2 * pad_size);
    int p_dimyxc = channels * p_dimy * p_dimx;
    int p_dimxc = p_dimx * channels;

    for (int c = 0; c < channels; ++c) {
        // Ensuring coalesced memory access for input and rinput
        float value = input[n * dimcyx + c * dimyx + y * width + x];
        rinput[n * p_dimyxc + (y + pad_size) * p_dimxc + (x + pad_size) * channels + c] = value;
    }
}