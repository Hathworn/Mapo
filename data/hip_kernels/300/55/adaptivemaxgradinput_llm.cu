```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adaptivemaxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int output_h, int output_w)
{
    // Calculate thread coordinates
    int o = blockIdx.x;
    int i = o;
    int xx_start = threadIdx.x;
    int xx_step = blockDim.x;
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int yy_step = blockDim.y * gridDim.y;

    // Offset pointers based on plane
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;
    indices_x += o * output_w * output_h;
    indices_y += o * output_w * output_h;

    // Loop over all output elements
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        int y_start = static_cast<int>(yy * input_h / static_cast<float>(output_h));

        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            int x_start = static_cast<int>(xx * input_w / static_cast<float>(output_w));

            // Pointers to current gradOutput and indices
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float *ptr_ind_x = indices_x + yy * output_w + xx;
            float *ptr_ind_y = indices_y + yy * output_w + xx;
            float z = *ptr_gradOutput;

            // Argument max coordinates with bounds check
            int argmax_x = (*ptr_ind_x) - 1;
            int argmax_y = (*ptr_ind_y) - 1;

            // Ensure indexes are within bounds
            if (argmax_x >= 0 && argmax_x < input_w && argmax_y >= 0 && argmax_y < input_h) {
                gradInput[(y_start + argmax_y) * input_w + (x_start + argmax_x)] += z;
            }
        }
    }
}