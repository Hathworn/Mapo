```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adaptivemaxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int output_h, int output_w)
{
    // Compute offsets based on thread/block ID
    int o = blockIdx.x;

    // Calculate thread positioning
    int xx = threadIdx.x;
    int yy = blockIdx.y * blockDim.y + threadIdx.y;

    // Select input/output plane
    float *gradOutput_plane = gradOutput + o * output_w * output_h;
    float *gradInput_plane = gradInput + o * input_w * input_h;
    float *indices_x_plane = indices_x + o * output_w * output_h;
    float *indices_y_plane = indices_y + o * output_w * output_h;

    // Stride over the y dimension
    for (int yy_stride = yy; yy_stride < output_h; yy_stride += blockDim.y * gridDim.y) {
        int y_start = (int)floorf((float)yy_stride / output_h * input_h);

        // Stride over the x dimension
        for (int xx_stride = xx; xx_stride < output_w; xx_stride += blockDim.x) {
            int x_start = (int)floorf((float)xx_stride / output_w * input_w);

            float z = gradOutput_plane[yy_stride * output_w + xx_stride];

            int argmax_x = (int)indices_x_plane[yy_stride * output_w + xx_stride] - 1;
            int argmax_y = (int)indices_y_plane[yy_stride * output_w + xx_stride] - 1;

            atomicAdd(&(gradInput_plane[argmax_x + argmax_y * input_w]), z); // Use atomicAdd for correct concurrency handling
        }
    }
}