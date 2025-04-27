#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fp_maxpool(float* output, float* input, const int kernel_size, const int size, const int n_size, const int in_channel, bool SAME)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int totalPos = blockDim.x * gridDim.x;
    const int N = kernel_size * kernel_size * n_size * n_size * in_channel;  // total number of connections in this convolution
    const int padding = (kernel_size - 1) / 2;  // number of padding for both ends
    
    for(int n = N * pos / totalPos; n < N * (pos+1) / totalPos; n++) {
        int idx = n;
        const int i_kernel_row = idx % kernel_size;
        idx /= kernel_size;
        const int i_kernel_col = idx % kernel_size;
        idx /= kernel_size;
        const int i_channel = idx % in_channel;
        idx /= in_channel;
        const int i_row = idx % n_size;
        const int i_col = idx / n_size;  // avoids recomputation
        float maxidx = (float)-100;

        // Calculate input matrix positions
        int input_row = i_kernel_row + i_row - (SAME ? padding : 0);
        int input_col = i_kernel_col + i_col - (SAME ? padding : 0);
        
        if(input_row >= 0 && input_row < size && input_col >= 0 && input_col < size) {
            int input_index = ((i_channel * size + input_col) * size + input_row);
            if (input[input_index] > maxidx) {
                output[((i_channel * n_size + i_col) * n_size + i_row)] = input[input_index];
            }
        }
    }
}