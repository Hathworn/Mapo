#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void convolve_gpu_kernel(float *input, float *weights, float *output, int in_w, int in_h, int in_c, int n, int size, int pad)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int x = index % in_w;
    int index2 = index / in_w;
    int y = index2 % in_h;
    int fil = index2 / in_h;

    // Early exit if fil index is out of range
    if (fil >= n) return;

    // Calculate output index and initialize sum
    int output_index = fil * in_w * in_h + y * in_w + x;
    float sum = 0.0f;

    // Loop over channels
    for (int chan = 0; chan < in_c; ++chan)
    {
        int input_pre_index = chan * in_w * in_h;
        int weights_pre_index = fil * in_c * size * size + chan * size * size;

        // Loop over filter height and width
        for (int f_y = 0; f_y < size; ++f_y)
        {
            int input_y = y + f_y - pad;
            if (input_y < 0 || input_y >= in_h) continue;  // Skip invalid y
            
            for (int f_x = 0; f_x < size; ++f_x)
            {
                int input_x = x + f_x - pad;
                if (input_x < 0 || input_x >= in_w) continue;  // Skip invalid x

                int input_index = input_pre_index + input_y * in_w + input_x;
                int weights_index = weights_pre_index + f_y * size + f_x;

                // Sum the product of input and weights
                sum += input[input_index] * weights[weights_index];
            }
        }
    }

    // Update the output at the current index
    output[output_index] = sum;
}