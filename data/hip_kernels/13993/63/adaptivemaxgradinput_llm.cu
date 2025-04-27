#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adaptivemaxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int output_h, int output_w)
{
    // compute block index
    int o = blockIdx.x;
    int i = o;

    // compute thread index for y and x
    int xx = threadIdx.x;
    int yy = blockDim.y * blockIdx.y + threadIdx.y;

    // select input/output plane
    gradOutput += o * output_w * output_h;
    gradInput += i * input_w * input_h;
    indices_x += o * output_w * output_h;
    indices_y += o * output_w * output_h;

    // loop over the output height
    while (yy < output_h) {
        int y_start = (int)floorf(float(yy) / output_h * input_h);

        // loop over the output width
        int xx_iter = xx;
        while (xx_iter < output_w) {
            int x_start = (int)floorf(float(xx_iter) / output_w * input_w);

            float *ptr_gradInput = gradInput + y_start * input_w + x_start;
            float *ptr_gradOutput = gradOutput + yy * output_w + xx_iter;
            float *ptr_ind_x = indices_x + yy * output_w + xx_iter;
            float *ptr_ind_y = indices_y + yy * output_w + xx_iter;
            float z = *ptr_gradOutput;

            int argmax_x = (*ptr_ind_x) - 1;
            int argmax_y = (*ptr_ind_y) - 1;

            atomicAdd(&ptr_gradInput[argmax_x + argmax_y * input_w], z); // Use atomicAdd for potential race conditions

            xx_iter += blockDim.x;
        }
        yy += blockDim.y * gridDim.y;
    }
}