#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bp_output_conv(float *d_output, float *weight, float *nd_preact, const int size, const int kernel_size, const int n_size, const int in_channel, const int out_channel, bool CONV, bool SAME)
{
    // Calculate global thread position
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int totalPos = blockDim.x * gridDim.x;

    // Pre-calculate constants
    const int N = kernel_size * kernel_size * size * size * in_channel * out_channel;
    const int weight_channel = out_channel * in_channel;
    const int padding = (kernel_size - 1) / 2;

    for (int n = N * pos / totalPos; n < N * (pos + 1) / totalPos; ++n) {
        int idx = n;

        // Sequential access optimization
        const int i_channel = idx % weight_channel;
        idx /= weight_channel;
        const int i_kernel_row = idx % kernel_size;
        idx /= kernel_size;
        const int i_kernel_col = idx % kernel_size;
        idx /= kernel_size;
        const int i_row = idx % size;
        idx /= size;
        const int i_col = idx % size;

        // Determine input position based on padding scheme
        const int bpinput_row = i_kernel_row + i_row - (SAME ? padding : 2 * padding);
        const int bpinput_col = i_kernel_col + i_col - (SAME ? padding : 2 * padding);

        // Update output if within bounds
        if (bpinput_row >= 0 && bpinput_row < n_size && bpinput_col >= 0 && bpinput_col < n_size) {
            atomicAdd(&d_output[((i_channel % in_channel) * size + i_col) * size + i_row],
                      weight[(i_channel * kernel_size + (kernel_size - 1 - i_kernel_col)) * kernel_size + kernel_size - 1 - i_kernel_row]
                      * nd_preact[((i_channel % out_channel) * n_size + bpinput_col) * n_size + bpinput_row]);
        }
    }
}