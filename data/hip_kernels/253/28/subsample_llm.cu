```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;

    int xx = threadIdx.x;
    int yy = blockDim.y * blockIdx.y + threadIdx.y;

    // Select input/output plane
    output += o * output_w * output_h;
    input += i * input_w * input_h;

    // Check bounds to ensure threads operate within the output limits
    if (yy < output_h) {
        for (; xx < output_w; xx += blockDim.x) {
            // Compute the mean of the input image
            float sum = 0.0f;
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    sum += input[(yy * dH + ky) * input_w + xx * dW + kx];
                }
            }
            // Update output
            output[yy * output_w + xx] = sum / (kW * kH);
        }
    }
}