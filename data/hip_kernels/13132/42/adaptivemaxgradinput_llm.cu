#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adaptivemaxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int output_h, int output_w)
{
    // Compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;

    int xx_start = threadIdx.x;
    int xx_step = blockDim.x;

    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int yy_step = blockDim.y * gridDim.y;

    // Select input/output plane
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;
    indices_x += o * output_w * output_h;
    indices_y += o * output_w * output_h;

    // Pre-compute scales to avoid float division inside loops
    float scale_x = float(input_w) / output_w;
    float scale_y = float(input_h) / output_h;

    // Compute gradInput
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        int y_start = static_cast<int>(yy * scale_y);

        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            int x_start = static_cast<int>(xx * scale_x);

            float *ptr_gradInput = gradInput + y_start * input_w + x_start;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float *ptr_ind_x = indices_x + yy * output_w + xx;
            float *ptr_ind_y = indices_y + yy * output_w + xx;

            float z = *ptr_gradOutput;
            int argmax_x = (*ptr_ind_x) - 1;
            int argmax_y = (*ptr_ind_y) - 1;

            // Use atomic operation to prevent race conditions
            atomicAdd(&ptr_gradInput[argmax_x + argmax_y * input_w], z);
        }
    }
}