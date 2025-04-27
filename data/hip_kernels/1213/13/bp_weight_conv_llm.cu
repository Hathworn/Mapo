#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bp_weight_conv(float* d_weight, float* d_preact, float* p_output, const int kernel_size, const int size, const int n_size, const int in_channel, const int out_channel, bool SAME)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int totalPos = blockDim.x * gridDim.x;
    const int N = kernel_size * kernel_size * n_size * n_size * in_channel * out_channel;  // total number of connections in this convolution
    const int weight_channel = in_channel * out_channel;
    const int padding = (kernel_size - 1) / 2;
    int input_row, input_col;

    // calculate thread range
    int n_start = N * pos / totalPos;
    int n_end = N * (pos + 1) / totalPos;

    // loop through assigned connections
    for (int n = n_start; n < n_end; n++) {
        int idx = n;
        const int i_kernel_row = idx % kernel_size;
        idx /= kernel_size;
        const int i_kernel_col = idx % kernel_size;
        idx /= kernel_size;
        const int i_channel = idx % weight_channel;
        idx /= weight_channel;
        const int i_row = idx % n_size;
        const int i_col = idx / n_size;

        // calculate input index
        if (SAME) {
            input_row = i_kernel_row + i_row - padding;
            input_col = i_kernel_col + i_col - padding;
        } else {
            input_row = i_kernel_row + i_row;
            input_col = i_kernel_col + i_col;
        }

        if (input_row >= 0 && input_row < size && input_col >= 0 && input_col < size) {
            atomicAdd(&d_weight[(i_channel * kernel_size + i_kernel_col) * kernel_size + i_kernel_row],
                      d_preact[((i_channel % out_channel) * n_size + i_col) * n_size + i_row] * p_output[((i_channel % in_channel) * size + input_col) + input_row]);
        }
    }
}