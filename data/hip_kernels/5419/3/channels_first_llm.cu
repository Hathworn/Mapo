#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void channels_first(float* input, float* rinput, int channels, int height, int width, int pad_size)
{
    // Compute global thread indices
    int n = blockIdx.x;
    int y = blockIdx.y;
    int x = blockIdx.z;
    int ch_off = threadIdx.x;
    
    // Precomputed dimensions for performance improvement
    int dimcyx = channels * height * width;
    int dimyx = height * width;
    
    int p_dimx = (width + 2 * pad_size);
    int p_dimy = (height + 2 * pad_size);
    int p_dimyxc = channels * p_dimy * p_dimx;
    int p_dimxc = p_dimx * channels;

    // Unrolling loop for better performance
    #pragma unroll
    for (int c = ch_off; c < channels; c += blockDim.x) {
        // Coalesced memory access and reduction of arithmetic inside the loop
        float value = input[n * dimcyx + c * dimyx + y * width + x];
        int output_index = n * p_dimyxc + 
                           (y + pad_size) * p_dimxc + 
                           (x + pad_size) * channels + c;
        rinput[output_index] = value;
    }
}