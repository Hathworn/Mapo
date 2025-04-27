#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, float *weight, float *bias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output size only once
    const int output_w = (input_w - kW) / dW + 1;
    const int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on thread/block ID
    const int o = blockIdx.x;
    const int i = o;
    const int k = blockIdx.x % input_n;

    const int xx_start = threadIdx.x;
    const int xx_step = blockDim.x;

    const int yy_start = blockDim.y * blockIdx.y + threadIdx.y;
    const int yy_step = blockDim.y * gridDim.y;

    // Offset output and input pointers once
    float* out_ptr = output + o * output_w * output_h;
    float* in_ptr = input + i * input_w * input_h;

    // Get the weight and bias for this block
    const float the_weight = weight[k];
    const float the_bias = bias[k];

    // Iterate over output pixels
    for (int yy = yy_start; yy < output_h; yy += yy_step) {
        for (int xx = xx_start; xx < output_w; xx += xx_step) {
            // Initialize sum for current output element
            float sum = 0;

            // Iterate over the kernel size
            for (int ky = 0; ky < kH; ky++) {
                // Calculate input row start position
                float* row_ptr = in_ptr + (yy * dH + ky) * input_w + xx * dW;
                
                // Accumulate sum for current (yy, xx) output position
                for (int kx = 0; kx < kW; kx++) {
                    sum += row_ptr[kx];
                }
            }
            // Update the output with weighted sum and bias
            out_ptr[yy * output_w + xx] = the_weight * sum + the_bias;
        }
    }
}
```
