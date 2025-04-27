#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void atomicadaptivemaxgradinput( float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int output_h, int output_w )
{
    // compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;

    int xx_start = threadIdx.x;
    int xx_step = blockDim.x;

    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int yy_step = blockDim.y * gridDim.y;

    // select input/output plane
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;
    indices_x += o * output_w * output_h;
    indices_y += o * output_w * output_h;

    // compute gradInput
    for(int yy = yy_start; yy < output_h; yy += yy_step) {

        int y_start = __float2int_rd(float(yy) / output_h * input_h); // Use faster rounding instruction

        for(int xx = xx_start; xx < output_w; xx += xx_step) {

            int x_start = __float2int_rd(float(xx) / output_w * input_w); // Use faster rounding instruction

            float *ptr_gradInput = gradInput + y_start * input_w + x_start;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float *ptr_ind_x = indices_x + yy * output_w + xx;
            float *ptr_ind_y = indices_y + yy * output_w + xx;
            float z = *ptr_gradOutput;

            int argmax_x = __float2int_rd(*ptr_ind_x) - 1; // Optimize with faster rounding and index calculation
            int argmax_y = __float2int_rd(*ptr_ind_y) - 1; // Optimize with faster rounding and index calculation

            // atomic add since different threads could update the same variable
            atomicAdd(&(ptr_gradInput[argmax_x + argmax_y * input_w]), z);
        }
    }
}