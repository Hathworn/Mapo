#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bp_weight_conv(float* d_weight, float* d_preact, float* p_output, const int kernel_size, const int size, const int n_size, const int in_channel, const int out_channel, bool SAME)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int totalPos = blockDim.x * gridDim.x;
    const int N = kernel_size * kernel_size * n_size * n_size * in_channel * out_channel;  // total number of connections in this convolution
    const int weight_channel = in_channel * out_channel;  // actual number of channels of weight matrix
    const int padding = (kernel_size - 1) / 2;  // number of padding for both ends

    // distribute certain number of connections to each thread regardless of detailed position and shape
    for(int n = N * pos / totalPos; n < N * (pos+1) / totalPos; n++){
        int idx = n;
        const int i_kernel_row = idx % kernel_size;
        idx /= kernel_size;
        const int i_kernel_col = idx % kernel_size;
        idx /= kernel_size;
        const int i_channel = idx % weight_channel;
        idx /= weight_channel;
        const int i_row = idx % n_size;
        idx /= n_size;
        const int i_col = idx % n_size;

        // corresponding position of the input matrix
        int input_row = i_kernel_row + i_row - (SAME ? padding : 0);  // Simplified row calculation
        int input_col = i_kernel_col + i_col - (SAME ? padding : 0);  // Simplified col calculation
        
        // Ensure input position is within bounds
        if(input_row >= 0 && input_row < size && input_col >=0 && input_col < size){
            atomicAdd(&d_weight[(i_channel * kernel_size + i_kernel_col) * kernel_size + i_kernel_row],
                      d_preact[((i_channel % out_channel) * n_size + i_col) * n_size + i_row] * p_output[((i_channel % in_channel) * size + input_col) + input_row]);
        }
    }
}