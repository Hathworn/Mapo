#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adaptivemaxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int output_h, int output_w)
{
    // Calculate global thread position
    int o = blockIdx.x;
    int xx = threadIdx.x + blockIdx.y * blockDim.x;
    int yy = blockIdx.y * blockDim.y + threadIdx.y;

    // Return if the thread is outside the output dimensions
    if (xx >= output_w || yy >= output_h) return;
    
    // Offsets into respective arrays for the current batch
    gradOutput += o * output_w * output_h;
    gradInput += o * input_w * input_h;
    indices_x += o * output_w * output_h;
    indices_y += o * output_w * output_h;
    
    // Compute y_start and x_start only once per thread
    int x_start = __float2int_rd(static_cast<float>(xx) / output_w * input_w);
    int y_start = __float2int_rd(static_cast<float>(yy) / output_h * input_h);

    // Pointers for accessing specific positions in the arrays
    float *ptr_gradInput = gradInput + y_start * input_w + x_start;
    float *ptr_gradOutput = gradOutput + yy * output_w + xx;
    float *ptr_ind_x = indices_x + yy * output_w + xx;
    float *ptr_ind_y = indices_y + yy * output_w + xx;
    float z = *ptr_gradOutput;

    // Compute argmax positions
    int argmax_x = static_cast<int>(*ptr_ind_x) - 1;
    int argmax_y = static_cast<int>(*ptr_ind_y) - 1;

    // Accumulate gradient input
    ptr_gradInput[argmax_x + argmax_y * input_w] += z;
}