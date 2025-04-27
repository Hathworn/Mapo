#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fp_conv(float* output, float* input, float* weight, const int kernel_size, const int size, const int n_size, const int in_channel, const int out_channel, bool SAME)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int totalPos = blockDim.x * gridDim.x;
    const int N = kernel_size * kernel_size * n_size * n_size * in_channel * out_channel;
    const int weight_channel = in_channel * out_channel;  
    const int padding = (kernel_size - 1) / 2;  

    // Optimize: Loop stride step greater than 1 for better utilization
    for(int n = N * pos / totalPos; n < N * (pos+1) / totalPos; n += blockDim.x)
    {
        int idx = n;
        const int i_kernel_row = (idx % kernel_size); idx /= kernel_size;
        const int i_kernel_col = (idx % kernel_size); idx /= kernel_size;
        const int i_channel = (idx % weight_channel); idx /= weight_channel;
        const int i_row = (idx % n_size); idx /= n_size;
        const int i_col = (idx % n_size);

        int input_row, input_col;

        if (SAME)
        {
            input_row = i_kernel_row + i_row - padding;
            input_col = i_kernel_col + i_col - padding;
        }
        else
        {
            input_row = i_kernel_row + i_row;
            input_col = i_kernel_col + i_col;
        }

        if(input_row >= 0 && input_row < size && input_col >=0 && input_col < size)
        {
            atomicAdd(&output[((i_channel % out_channel) * n_size + i_col) * n_size + i_row],
                      weight[(i_channel * kernel_size + i_kernel_col) * kernel_size + i_kernel_row]
                      * input[((i_channel % in_channel) * size + input_col) * size + input_row]);
        }
    }
}