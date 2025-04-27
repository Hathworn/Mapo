#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, float *weight, float *bias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW) {
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on thread/block ID
    int batch_idx = blockIdx.x;
    int k = batch_idx % input_n; // Select input/output plane

    // Calculate Start, End, Step values for xx, yy
    int xx_start = threadIdx.x;
    int xx_step = blockDim.x;
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    int yy_step = blockDim.y * gridDim.y;

    // Point to correct portion of input/output
    float *output_plane = output + batch_idx * output_w * output_h;
    float *input_plane = input + batch_idx * input_w * input_h;

    float the_weight = weight[k];
    float the_bias = bias[k];

    // Loop over output pixels
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            float *input_ptr = input_plane + yy * dH * input_w + xx * dW;
            float *output_ptr = output_plane + yy * output_w + xx;

            float sum = 0.0f;

            // Compute the mean of the input image
            for (int ky = 0; ky < kH; ++ky) {
                for (int kx = 0; kx < kW; ++kx) {
                    sum += input_ptr[kx]; // Accumulate
                }
                input_ptr += input_w; // Move to next row
            }

            // Update output with weight and bias
            *output_ptr = the_weight * sum + the_bias;
        }
    }
}