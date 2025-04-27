#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void atomicadaptivemaxgradinput( float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int output_h, int output_w )
{
    // Compute thread IDs
    int o = blockIdx.x;
    int i = o;
    int xx = threadIdx.x + blockIdx.y * blockDim.x;
    int yy = blockIdx.z * blockDim.y + threadIdx.y;

    // Select input/output plane
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;
    indices_x += o * output_w * output_h;
    indices_y += o * output_w * output_h;

    // Check if thread is within bounds
    if (xx < output_w && yy < output_h) {
        // Compute indices for input and output
        int y_start = static_cast<int>(floorf(float(yy) / output_h * input_h));
        int x_start = static_cast<int>(floorf(float(xx) / output_w * input_w));

        float *ptr_gradInput = gradInput + y_start * input_w + x_start;
        float *ptr_gradOutput = gradOutput + yy * output_w + xx;
        float *ptr_ind_x = indices_x + yy * output_w + xx;
        float *ptr_ind_y = indices_y + yy * output_w + xx;
        float z = *ptr_gradOutput;

        int argmax_x = static_cast<int>(*ptr_ind_x) - 1;
        int argmax_y = static_cast<int>(*ptr_ind_y) - 1;

        // Atomic add since different threads could update the same variable
        atomicAdd(&ptr_gradInput[argmax_x + argmax_y * input_w], z);
    }
}