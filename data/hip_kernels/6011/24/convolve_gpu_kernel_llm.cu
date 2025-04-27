#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void convolve_gpu_kernel(float *input, float *weights, float *output, int in_w, int in_h, int in_c, int n, int size, int pad)
{
    // Calculate unique global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate corresponding x, y, and fil indices
    int x = index % in_w;
    int index2 = index / in_w;
    int y = index2 % in_h;
    int fil = index2 / in_h;

    // Check boundary conditions
    if (fil < n) {

        // Calculate output index
        int const output_index = fil * in_w * in_h + y * in_w + x;
        float sum = 0;

        // Iterate through input channels
        for (int chan = 0; chan < in_c; ++chan) {
            int const weights_pre_index = fil * in_c * size * size + chan * size * size;
            int const input_pre_index = chan * in_w * in_h;

            // Loop unrolling for filter - y and x
            #pragma unroll
            for (int f_y = 0; f_y < size; ++f_y) {
                int input_y = y + f_y - pad;
                #pragma unroll
                for (int f_x = 0; f_x < size; ++f_x) {
                    int input_x = x + f_x - pad;
                    if (input_y < 0 || input_x < 0 || input_y >= in_h || input_x >= in_w) continue;

                    // Calculate input and weights indices
                    int input_index = input_pre_index + input_y * in_w + input_x;
                    int weights_index = weights_pre_index + f_y * size + f_x;

                    // Accumulate weighted sum
                    sum += input[input_index] * weights[weights_index];
                }
            }
        }
        // Store result in output array
        output[output_index] = sum;
    }
}