#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void maxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
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

int yy_start = blockDim.y*blockIdx.y + threadIdx.y;
int yy_end = output_h;
int yy_step = blockDim.y*gridDim.y;

// select input/output plane
gradOutput = gradOutput + o * output_w * output_h;
gradInput = gradInput + i * input_w * input_h;
indices_x = indices_x + o * output_w * output_h;
indices_y = indices_y + o * output_w * output_h;

// compute gradInput
for (int yy = yy_start; yy < yy_end; yy += yy_step) {
    for (int xx = xx_start; xx < xx_end; xx += xx_step) {
        int idx_output = yy * output_w + xx;
        int idx_input = (int)indices_y[idx_output] - 1;
        int idx_output_x = (int)indices_x[idx_output] - 1;
        float z = gradOutput[idx_output];
        
        // Direct access optimization
        gradInput[idx_output_x + idx_input * input_w] += z;
    }
}
}