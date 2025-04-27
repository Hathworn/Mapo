#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adaptivemaxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int output_h, int output_w)
{
    // Compute offsets for parallel execution based on thread and block ID
    int o = blockIdx.x;
    int i = o;
    gradOutput = gradOutput + o * output_w * output_h;
    gradInput = gradInput + i * input_w * input_h;
    indices_x = indices_x + o * output_w * output_h;
    indices_y = indices_y + o * output_w * output_h;

    int xx_start = threadIdx.x + blockIdx.y * blockDim.x;
    int xx_step = blockDim.x * gridDim.y;
    int yy_start = threadIdx.y;
    int yy_step = blockDim.y;

    // Compute gradInput using efficient thread indexing
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        int y_start = (int)floor(float(yy) / output_h * input_h);

        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            int x_start = (int)floor(float(xx) / output_w * input_w);

            float *ptr_gradInput = gradInput + y_start * input_w + x_start;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float *ptr_ind_x = indices_x + yy * output_w + xx;
            float *ptr_ind_y = indices_y + yy * output_w + xx;
            float z = *ptr_gradOutput;

            int argmax_x = (*ptr_ind_x) - 1;
            int argmax_y = (*ptr_ind_y) - 1;

            ptr_gradInput[argmax_x + argmax_y * input_w] += z;
        }
    }
}