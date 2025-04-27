#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adaptivemaxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int output_h, int output_w) {
    // Compute global thread indices for reduced loop calculations
    int xx_start = blockDim.x * blockIdx.x + threadIdx.x;
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;

    if (xx_start < output_w && yy_start < output_h) {
        // Locate the corresponding positions in memory
        float *ptr_gradOutput = gradOutput + (blockIdx.x * output_w * output_h) + yy_start * output_w + xx_start;
        float *ptr_ind_x = indices_x + (blockIdx.x * output_w * output_h) + yy_start * output_w + xx_start;
        float *ptr_ind_y = indices_y + (blockIdx.x * output_w * output_h) + yy_start * output_w + xx_start;

        int x_start = (int)floorf(float(xx_start) / output_w * input_w);
        int y_start = (int)floorf(float(yy_start) / output_h * input_h);

        float z = *ptr_gradOutput;
        int argmax_x = (*ptr_ind_x)-1;
        int argmax_y = (*ptr_ind_y)-1;

        // Use atomicAdd to avoid race conditions
        float *ptr_gradInput = gradInput + (blockIdx.x * input_w * input_h) + (y_start + argmax_y) * input_w + (x_start + argmax_x);
        atomicAdd(ptr_gradInput, z);
    }
}