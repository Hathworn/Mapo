#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, float *weight, float *bias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Deduce indices and strides
    int o = blockIdx.x;
    int k = o % input_n;
    int xx = threadIdx.x;
    int yy = blockIdx.y * blockDim.y + threadIdx.y;

    // Select input/output starting positions
    output += o * output_w * output_h;
    input += o * input_w * input_h;

    // Load weight and bias
    float the_weight = weight[k];
    float the_bias = bias[k];

    // Stride in blockDim.x allows the use of multiple threads in x direction
    for(; yy < output_h; yy += blockDim.y * gridDim.y) {
        for(int xx = threadIdx.x; xx < output_w; xx += blockDim.x) {
            float sum = 0;
            // Compute the mean of the input image...
            for(int ky = 0; ky < kH; ++ky) {
                for(int kx = 0; kx < kW; ++kx) {
                    sum += input[(yy * dH + ky) * input_w + (xx * dW + kx)];
                }
            }
            // Update output
            output[yy * output_w + xx] = the_weight * sum + the_bias;
        }
    }
}