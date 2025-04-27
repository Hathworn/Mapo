#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adaptivemaxgradinput(float *gradInput, float *gradOutput, float *indices_x, float *indices_y, int input_n, int input_h, int input_w, int output_h, int output_w)
{
    // Calculate offsets based on thread/block ID
    int o = blockIdx.x;
    int i = o;

    int xx = threadIdx.x;
    int yy = blockDim.y * blockIdx.y + threadIdx.y;
    
    extern __shared__ float shared_data[];

    // Select input/output plane
    gradOutput = gradOutput + o * output_w * output_h;
    gradInput = gradInput + i * input_w * input_h;
    indices_x = indices_x + o * output_w * output_h;
    indices_y = indices_y + o * output_w * output_h;

    // Compute gradInput
    while (yy < output_h) {
        int y_start = static_cast<int>(floorf(static_cast<float>(yy) / output_h * input_h));
        int x_start = static_cast<int>(floorf(static_cast<float>(xx) / output_w * input_w));
        
        float *ptr_gradInput = gradInput + y_start * input_w + x_start;
        float *ptr_gradOutput = gradOutput + yy * output_w + xx;
        float *ptr_ind_x = indices_x + yy * output_w + xx;
        float *ptr_ind_y = indices_y + yy * output_w + xx;
        
        // Pre-fetch gradOutput value to improve memory access pattern
        float z = __ldg(ptr_gradOutput);

        int argmax_x = __float2int_rd(*ptr_ind_x) - 1;
        int argmax_y = __float2int_rd(*ptr_ind_y) - 1;

        // Use atomic add to safely update from multiple threads
        atomicAdd(&ptr_gradInput[argmax_x + argmax_y * input_w], z);

        xx += blockDim.x;
        yy += blockDim.y * gridDim.y;
    }
}