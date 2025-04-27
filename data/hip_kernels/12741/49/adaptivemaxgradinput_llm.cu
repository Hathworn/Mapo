#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adaptivemaxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int output_h, int output_w)
{
    // Compute global thread indices
    int xx = blockIdx.x * blockDim.x + threadIdx.x;
    int yy = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds 
    if (xx >= output_w || yy >= output_h) return;

    // Plane offset
    int o = blockIdx.z; // Using blockIdx.z for multiple image planes as each x, y block handles a different plane
    gradOutput += o * output_w * output_h;
    gradInput += o * input_w * input_h;
    indices_x += o * output_w * output_h;
    indices_y += o * output_w * output_h;

    // Calculate input indices
    int y_start = __float2int_rd(float(yy) / output_h * input_h);
    int x_start = __float2int_rd(float(xx) / output_w * input_w);

    // Compute addresses
    float *ptr_gradInput = gradInput + y_start * input_w + x_start;
    float *ptr_gradOutput = gradOutput + yy * output_w + xx;
    float *ptr_ind_x = indices_x + yy * output_w + xx;
    float *ptr_ind_y = indices_y + yy * output_w + xx;
    
    // Update gradInput with gradient from gradOutput
    int argmax_x = __float2int_rd(*ptr_ind_x) - 1;
    int argmax_y = __float2int_rd(*ptr_ind_y) - 1;

    atomicAdd(&ptr_gradInput[argmax_x + argmax_y * input_w], *ptr_gradOutput);
}