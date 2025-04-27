#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void atomicadaptivemaxgradinput( float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int output_h, int output_w )
{
    // Compute global thread indices
    int o = blockIdx.x;
    int i = o;
    int xx = blockIdx.y * blockDim.x + threadIdx.x;
    int yy_increment = blockDim.y * gridDim.y;

    if (xx >= output_w) return; // Ignore threads outside output bounds

    // Offsets for plane selection
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;
    indices_x += o * output_w * output_h;
    indices_y += o * output_w * output_h;
    
    // Loop over output height
    for (int yy = blockIdx.y * blockDim.y + threadIdx.y; yy < output_h; yy += yy_increment) {

        int y_start = (int)(yy * input_h / (float)output_h);
        int x_start = (int)(xx * input_w / (float)output_w);

        float *ptr_gradInput = gradInput + y_start * input_w + x_start;
        float *ptr_gradOutput = gradOutput + yy * output_w + xx;
        float *ptr_ind_x = indices_x + yy * output_w + xx;
        float *ptr_ind_y = indices_y + yy * output_w + xx;
        float z = *ptr_gradOutput;

        int argmax_x = (*ptr_ind_x) - 1;
        int argmax_y = (*ptr_ind_y) - 1;

        // Atomic operation ensures safe concurrent updates
        atomicAdd(&(ptr_gradInput[argmax_x + argmax_y * input_w]), z);
    }
}