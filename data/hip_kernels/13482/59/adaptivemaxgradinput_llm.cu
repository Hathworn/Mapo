#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adaptivemaxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int output_h, int output_w)
{
    // Compute global thread ID for efficient memory access
    int xx = threadIdx.x + blockIdx.x * blockDim.x;
    int yy = threadIdx.y + blockIdx.y * blockDim.y;

    if (xx < output_w && yy < output_h) // Boundary check
    {
        int o = blockIdx.z; // Use blockIdx.z for handling batches/input_n

        // Offsets for current output plane
        gradOutput += o * output_w * output_h;
        gradInput += o * input_w * input_h;
        indices_x += o * output_w * output_h;
        indices_y += o * output_w * output_h;

        // Calculate input coordinates
        int y_start = (int)floorf(float(yy) / output_h * input_h);
        int x_start = (int)floorf(float(xx) / output_w * input_w);

        float *ptr_gradInput = gradInput + y_start * input_w + x_start;
        float *ptr_gradOutput = gradOutput + yy * output_w + xx;
        float *ptr_ind_x = indices_x + yy * output_w + xx;
        float *ptr_ind_y = indices_y + yy * output_w + xx;
        float z = *ptr_gradOutput;

        int argmax_x = (*ptr_ind_x) - 1;
        int argmax_y = (*ptr_ind_y) - 1;

        atomicAdd(&ptr_gradInput[argmax_x + argmax_y * input_w], z); // Atomic operation for thread safety
    }
}