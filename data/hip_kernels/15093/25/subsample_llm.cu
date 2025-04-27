#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;

    int xx_start = threadIdx.x;
    int xx_end = output_w;
    int xx_step = blockDim.x;

    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int yy_end = output_h;
    int yy_step = blockDim.y * gridDim.y;

    // select input/output plane
    output = output + o * output_w * output_h;
    input = input + i * input_w * input_h;

    // For all output pixels...
    for (int yy = yy_start; yy < yy_end; yy += yy_step) {
        for (int xx = xx_start; xx < xx_end; xx += xx_step) {
            // Compute the mean of the input image...
            float sum = 0;
            int src_off_base = yy * dH * input_w + xx * dW;
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    // Calculate input index using offsets
                    int src_off = src_off_base + ky * input_w + kx;
                    sum += input[src_off];
                }
            }
            // Calculate output index and update output
            int dst_off = yy * output_w + xx;
            output[dst_off] = sum / float(kW * kH);  // Calculate mean
        }
    }
}