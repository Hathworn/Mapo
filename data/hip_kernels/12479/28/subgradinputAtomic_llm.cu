#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradinputAtomic(float *gradInput, float *gradOutput, float *weight, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // compute thread indices
    int xx = blockIdx.x * blockDim.x + threadIdx.x; 
    int yy = blockIdx.y * blockDim.y + threadIdx.y;

    // output size
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // bounds check
    if (xx >= output_w || yy >= output_h) return;

    // compute offsets
    int o = blockIdx.z;
    int i = o;
    int k = blockIdx.z % input_n;

    // select input/output plane
    gradOutput = gradOutput + o * output_w * output_h;
    gradInput = gradInput + i * input_w * input_h;

    // get weight
    float the_weight = weight[k];

    // compute pointers
    float *ptr_gradInput = gradInput + yy * dH * input_w + xx * dW;
    float *ptr_gradOutput = gradOutput + yy * output_w + xx;
    float z = *ptr_gradOutput * the_weight;

    // improve memory coalescing by ensuring atomic operations are contiguous
    for (int ky = 0; ky < kH; ky++)
    {
        for (int kx = 0; kx < kW; kx++)
        {
            atomicAdd(&ptr_gradInput[kx], z);
        }
        ptr_gradInput += input_w; // move to next row
    }
}