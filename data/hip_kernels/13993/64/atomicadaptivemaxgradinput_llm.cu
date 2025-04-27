```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void atomicadaptivemaxgradinput( float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int output_h, int output_w )
{
    // Compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;
    int xx_start = threadIdx.x;
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int xx_step = blockDim.x;
    int yy_step = blockDim.y * gridDim.y;

    // Select input/output plane
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;
    indices_x += o * output_w * output_h;
    indices_y += o * output_w * output_h;

    // Compute gradInput
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        int y_start = (int)floorf(float(yy) / output_h * input_h);

        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            int x_start = (int)floorf(float(xx) / output_w * input_w);

            float *ptr_gradInput = gradInput + y_start * input_w + x_start;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float *ptr_ind_x = indices_x + yy * output_w + xx;
            float *ptr_ind_y = indices_y + yy * output_w + xx;
            float z = *ptr_gradOutput;

            int argmax_x = (*ptr_ind_x) - 1;
            int argmax_y = (*ptr_ind_y) - 1;

            // Use atomic add since different threads could update the same variable
            atomicAdd(&(ptr_gradInput[argmax_x + argmax_y * input_w]), z);
        }
    }
}