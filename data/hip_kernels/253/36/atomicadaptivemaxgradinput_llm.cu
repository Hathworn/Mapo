#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void atomicadaptivemaxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int output_h, int output_w)
{
    // Improved iterator setup
    int xx = threadIdx.x + blockIdx.x * blockDim.x;
    int yy = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Compute offset
    int o = blockIdx.z; // Use 3D grid for batch processing
    int i = o;

    if (xx < output_w && yy < output_h) { // Boundary check
        // Select input/output plane
        gradOutput += o * output_w * output_h;
        gradInput += i * input_w * input_h;
        indices_x += o * output_w * output_h;
        indices_y += o * output_w * output_h;

        // Compute input coordinates
        int y_start = (yy * input_h) / output_h;
        int x_start = (xx * input_w) / output_w;

        float *ptr_gradInput = gradInput + y_start * input_w + x_start;
        float *ptr_gradOutput = gradOutput + yy * output_w + xx;
        float *ptr_ind_x = indices_x + yy * output_w + xx;
        float *ptr_ind_y = indices_y + yy * output_w + xx;
        float z = *ptr_gradOutput;

        int argmax_x = (*ptr_ind_x) - 1;
        int argmax_y = (*ptr_ind_y) - 1;

        // atomic add since different threads could update same variable
        atomicAdd(&(ptr_gradInput[argmax_x + argmax_y * input_w]), z);
    }
}