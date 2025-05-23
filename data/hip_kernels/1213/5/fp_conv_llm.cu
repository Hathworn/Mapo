#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fp_conv(float* output, float* input, float* weight, const int kernel_size, const int size, const int n_size, const int in_channel, const int out_channel, bool SAME)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int totalPos = blockDim.x * gridDim.x;
    const int weight_channel = in_channel * out_channel;
    const int padding = (kernel_size - 1) / 2;

    // Optimize with shared memory for weights
    extern __shared__ float shared_weights[];
    for (int i = threadIdx.x; i < kernel_size * kernel_size * weight_channel; i += blockDim.x) {
        shared_weights[i] = weight[i];
    }
    __syncthreads();

    const int N = kernel_size * kernel_size * n_size * n_size * in_channel * out_channel;
    for (int n = N * pos / totalPos; n < N * (pos + 1) / totalPos; n++) {
        int idx = n;
        const int i_kernel_row = ((idx /= 1) % kernel_size);
        const int i_kernel_col = ((idx /= kernel_size) % kernel_size);
        const int i_channel = ((idx /= kernel_size) % weight_channel);
        const int i_row = ((idx /= weight_channel) % n_size);
        const int i_col = ((idx /= n_size) % n_size);
        int input_row, input_col;

        // Calculate input position depending on padding
        if (SAME) {
            input_row = i_kernel_row + i_row - padding;
            input_col = i_kernel_col + i_col - padding;
        } else {
            input_row = i_kernel_row + i_row;
            input_col = i_kernel_col + i_col;
        }

        // Check input bounds and compute atomic operation
        if (input_row >= 0 && input_row < size && input_col >= 0 && input_col < size) {
            atomicAdd(&output[((i_channel % out_channel) * n_size + i_col) * n_size + i_row],
                      shared_weights[(i_channel * kernel_size + i_kernel_col) * kernel_size + i_kernel_row] *
                      input[((i_channel % in_channel) * size + input_col) * size + input_row]);
        }
    }
}