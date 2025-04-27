#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adaptivemaxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int output_h, int output_w)
{
    // Compute global thread indices
    int xx = blockIdx.x * blockDim.x + threadIdx.x;
    int yy = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread is within output bounds
    if (xx < output_w && yy < output_h) {
        // Compute the offset for the current output plane
        int o = blockIdx.z;
        gradOutput = gradOutput + o * output_w * output_h;
        gradInput = gradInput + o * input_w * input_h;
        indices_x = indices_x + o * output_w * output_h;
        indices_y = indices_y + o * output_w * output_h;

        // Calculate input indices
        int y_start = (int)floorf(float(yy) / output_h * input_h);
        int x_start = (int)floorf(float(xx) / output_w * input_w);

        // Get pointer to the relevant locations
        float *ptr_gradInput = gradInput + y_start * input_w + x_start;
        float *ptr_gradOutput = gradOutput + yy * output_w + xx;
        float *ptr_ind_x = indices_x + yy * output_w + xx;
        float *ptr_ind_y = indices_y + yy * output_w + xx;

        // Avoid shared memory; Directly update gradInput
        float z = *ptr_gradOutput;
        int argmax_x = (*ptr_ind_x) - 1;
        int argmax_y = (*ptr_ind_y) - 1;

        atomicAdd(&ptr_gradInput[argmax_x + argmax_y * input_w], z);
    }
}