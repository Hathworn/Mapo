#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void subsample(float *input, float *output, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on thread/block ID
    int o = blockIdx.x;
    int xx = threadIdx.x;
    int yy = blockDim.y * blockIdx.y + threadIdx.y;

    // Boundary check for y-dimension
    if (yy >= output_h) return;
    
    // Select input/output plane
    output += o * output_w * output_h;
    input += o * input_w * input_h;

    // For all output pixels, process in x-dimension (optimized loop)
    for (; xx < output_w; xx += blockDim.x) {
        // Compute the mean of the input image
        float *ptr_input = input + yy * dH * input_w + xx * dW;
        float sum = 0;
        for (int ky = 0; ky < kH; ky++) {
            for (int kx = 0; kx < kW; kx++) {
                sum += ptr_input[kx];
            }
            ptr_input += input_w; // Move to the next input line
        }
        // Update output
        output[yy * output_w + xx] = sum / float(kW * kH);
    }
}