#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adaptivemaxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int output_h, int output_w)
{
    // Precompute values that remain constant during the loop
    int o = blockIdx.x;
    int xx_end = output_w;
    int yy_end = output_h;
    int yy_step = blockDim.y * gridDim.y;

    // Select input/output plane
    gradOutput += o * output_w * output_h;
    gradInput += o * input_w * input_h;
    indices_x += o * output_w * output_h;
    indices_y += o * output_w * output_h;

    // Compute gradInput using optimized looping
    for (int yy = blockDim.y * blockIdx.y + threadIdx.y; yy < yy_end; yy += yy_step) {
        
        int y_start = __float2int_rd(float(yy) / output_h * input_h); // faster rounding method

        for (int xx = threadIdx.x; xx < xx_end; xx += blockDim.x) {
            
            int x_start = __float2int_rd(float(xx) / output_w * input_w); // faster rounding method

            float *ptr_gradInput = gradInput + y_start * input_w + x_start;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float *ptr_ind_x = indices_x + yy * output_w + xx;
            float *ptr_ind_y = indices_y + yy * output_w + xx;
            float z = *ptr_gradOutput;

            int argmax_x = __float2int_rd(*ptr_ind_x) - 1; // subtract 1 after rounding
            int argmax_y = __float2int_rd(*ptr_ind_y) - 1; // subtract 1 after rounding

            atomicAdd(ptr_gradInput + argmax_x + argmax_y * input_w, z); // use atomicAdd to prevent race conditions
        }
    }
}