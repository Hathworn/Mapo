```c
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

    // Precompute scaling factors
    float scale_h = float(input_h) / output_h;
    float scale_w = float(input_w) / output_w;

    // Parallelize over output dimensions using a single loop
    for (int index = yy_start * output_w + xx_start; index < output_h * output_w; index += yy_step * output_w + xx_step) {
        int xx = index % output_w;
        int yy = index / output_w;

        int y_start = (int)floor(yy * scale_h);
        int x_start = (int)floor(xx * scale_w);

        float *ptr_gradInput = gradInput + y_start * input_w + x_start;
        float *ptr_gradOutput = gradOutput + yy * output_w + xx;
        float *ptr_ind_x = indices_x + yy * output_w + xx;
        float *ptr_ind_y = indices_y + yy * output_w + xx;
        float z = *ptr_gradOutput;

        int argmax_x = (*ptr_ind_x) - 1;
        int argmax_y = (*ptr_ind_y) - 1;

        atomicAdd(&ptr_gradInput[argmax_x + argmax_y * input_w], z);  // Use atomicAdd for potential race conditions
    }
}