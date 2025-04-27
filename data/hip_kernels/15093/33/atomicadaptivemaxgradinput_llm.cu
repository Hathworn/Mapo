#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void atomicadaptivemaxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int output_h, int output_w)
{
    // Compute offsets based on thread/block ID
    int o = blockIdx.x;

    int xx_start = threadIdx.x;
    int xx_step = blockDim.x;

    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int yy_step = blockDim.y * gridDim.y;

    // Select input/output plane
    gradOutput += o * output_w * output_h;
    gradInput += o * input_w * input_h;
    indices_x += o * output_w * output_h;
    indices_y += o * output_w * output_h;

    // Compute gradInput
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        int y_start = static_cast<int>(yy * input_h / output_h);  // Precompute division

        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            int x_start = static_cast<int>(xx * input_w / output_w);  // Precompute division

            float *ptr_gradInput = gradInput + y_start * input_w + x_start;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float z = *ptr_gradOutput;

            int argmax_x = static_cast<int>(indices_x[yy * output_w + xx]) - 1;  // Reduce dereferencing
            int argmax_y = static_cast<int>(indices_y[yy * output_w + xx]) - 1;  // Reduce dereferencing

            // Atomic add since different threads could update the same variable
            atomicAdd(&(ptr_gradInput[argmax_x + argmax_y * input_w]), z);
        }
    }
}