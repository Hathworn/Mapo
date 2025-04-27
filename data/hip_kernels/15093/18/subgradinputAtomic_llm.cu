#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinputAtomic(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;

    int xx_start = threadIdx.x;
    int xx_end = output_w;
    int xx_step = blockDim.x;

    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int yy_end = output_h;
    int yy_step = blockDim.y * gridDim.y;

    // select input/output plane
    gradOutput = gradOutput + o * output_w * output_h;
    gradInput = gradInput + i * input_w * input_h;

    // get weight
    float the_weight = weight[k];

    // cache blockDim.x calculation
    int input_w_stride = dH * input_w;

    // compute gradInput
    for (int yy = yy_start; yy < yy_end; yy += yy_step) {
        for (int xx = xx_start; xx < xx_end; xx += xx_step) {
            float *ptr_gradInput = gradInput + yy * input_w_stride + xx * dW;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float z = (*ptr_gradOutput) * the_weight;

            // optimize inner loop by avoiding recalculating pointers
            float *ptr_input_row = ptr_gradInput;
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    atomicAdd(&(ptr_input_row[kx]), z);
                }
                ptr_input_row += input_w;
            }
        }
    }
}