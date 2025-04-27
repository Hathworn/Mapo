#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Compute output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;

    int xx = threadIdx.x;
    int yy = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Select input/output plane
    float *plane_output = output + o * output_w * output_h;
    float *plane_input = input + i * input_w * input_h;

    // Ensure thread operates within bounds
    if (xx < output_w && yy < output_h) {
        float *ptr_input = plane_input + yy * dH * input_w + xx * dW;
        float *ptr_output = plane_output + yy * output_w + xx;
        
        // Compute the mean of the input image
        float sum = 0;
        #pragma unroll
        for (int ky = 0; ky < kH; ky++) {
            #pragma unroll
            for (int kx = 0; kx < kW; kx++) { 
                sum += ptr_input[kx];
            }
            ptr_input += input_w; // Move to next line in the input
        }
        *ptr_output = sum / float(kW * kH);
    }
}