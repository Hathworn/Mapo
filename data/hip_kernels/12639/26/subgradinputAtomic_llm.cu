#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinputAtomic(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // iterators
    int xx, yy;
    
    // output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;
    
    // compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;

    int xx_start = threadIdx.x;
    int xx_step = blockDim.x;
    
    int yy_start = blockIdx.y * blockDim.y + threadIdx.y;
    int yy_step = blockDim.y * gridDim.y;
    
    // select input/output plane
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;
    
    // get weight
    float the_weight = weight[k];
    
    // compute gradInput
    for (yy = yy_start; yy < output_h; yy += yy_step) {
        for (xx = xx_start; xx < output_w; xx += xx_step) {
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float z = *ptr_gradOutput * the_weight;
            float *ptr_gradInput = gradInput + (yy * dH) * input_w + xx * dW;
            
            // Unroll kH loop for coalesced memory access
            for (int ky = 0; ky < kH; ky++, ptr_gradInput += input_w) {
                // Unroll kW loop for improved parallel execution
                for (int kx = 0; kx < kW; kx++) {
                    atomicAdd(&ptr_gradInput[kx], z);
                }
            }
        }
    }
}