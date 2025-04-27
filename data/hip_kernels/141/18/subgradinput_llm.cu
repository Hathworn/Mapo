#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinput(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Compute offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;

    int xx_start = threadIdx.x;
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;

    // Get pointers for input/output plane
    gradOutput = gradOutput + o * output_w * output_h;
    gradInput = gradInput + i * input_w * input_h;

    // Get weight
    float the_weight = weight[k];

    // Use shared memory for weights (optimization)
    extern __shared__ float shared_weight[];
    shared_weight[threadIdx.x] = the_weight;
    __syncthreads();

    // Compute gradInput
    for (int yy = yy_start; yy < output_h; yy += blockDim.y * gridDim.y)
    {
        for (int xx = xx_start; xx < output_w; xx += blockDim.x)
        {
            float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx;
            float z = *ptr_gradOutput * shared_weight[threadIdx.x];
            
            for (int ky = 0; ky < kH; ky++)
            {
                for (int kx = 0; kx < kW; kx++)
                {
                    ptr_gradInput[kx] += z;
                }
                ptr_gradInput += input_w;
            }
        }
    }
}