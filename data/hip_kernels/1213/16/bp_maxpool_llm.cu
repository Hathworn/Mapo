#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bp_maxpool(float* d_preact, float* preact, float* p_output, float* nd_output, const int kernel_size, const int size, const int n_size, const int in_channel, bool SAME)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int totalPos = blockDim.x * gridDim.x;
    const int N = kernel_size * kernel_size * n_size * n_size * in_channel;  // total number of connections in this convolution
    const int padding = (kernel_size - 1) / 2;  // number of padding for both ends

    // distribute certain number of connections to each thread regardless of detailed position and shape
    for (int n = N * pos / totalPos; n < N * (pos + 1) / totalPos; n++)
    {
        int idx = n;
        const int i_kernel_row = (idx % kernel_size);
        const int i_kernel_col = ((idx / kernel_size) % kernel_size);
        const int i_channel = ((idx / (kernel_size * kernel_size)) % in_channel);
        const int i_row = ((idx / (kernel_size * kernel_size * in_channel)) % n_size);
        const int i_col = ((idx / (kernel_size * kernel_size * in_channel * n_size)) % n_size);

        float maxidx = -1.0f;  // Use float literal
        int maxpos = 0;        // Track max position

        // corresponding position of the input matrix
        int input_row, input_col;
        if (SAME) // SAME padding scheme implemented
        {
            input_row = i_kernel_row + i_row - padding;
            input_col = i_kernel_col + i_col - padding;
        }
        else
        {
            input_row = i_kernel_row + i_row;
            input_col = i_kernel_col + i_col;
        }

        if (input_row >= 0 && input_row < size && input_col >= 0 && input_col < size)
        {
            // Simplify indexing calculation and reduce redundant modulo operation
            int current_idx = ((i_channel * size + input_col) * size + input_row);
            if (p_output[current_idx] > maxidx)
            {
                maxidx = p_output[current_idx];
                maxpos = current_idx;
            }
        }
        d_preact[maxpos] = nd_output[((i_channel * n_size + i_col) * n_size + i_row)];
    }
}