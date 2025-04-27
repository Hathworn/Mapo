#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bp_maxpool(float* d_preact, float* preact, float* p_output, float* nd_output, const int kernel_size, const int size, const int n_size, const int in_channel, bool SAME)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int totalPos = blockDim.x * gridDim.x;
    const int N = kernel_size * kernel_size * n_size * n_size * in_channel;
    const int padding = (kernel_size - 1) / 2;
    int input_row, input_col;

    // Use fewer divisions by storing initial division results
    const int n_start = N * pos / totalPos;
    const int n_end = N * (pos + 1) / totalPos;

    for(int n = n_start; n < n_end; n++){
        int idx = n;
        
        // Calculations with minimized operations.
        const int i_kernel_row = idx % kernel_size; idx /= kernel_size;
        const int i_kernel_col = idx % kernel_size; idx /= kernel_size;
        const int i_channel   = idx % in_channel; idx /= in_channel;
        const int i_row       = idx % n_size; idx /= n_size;
        const int i_col       = idx % n_size;

        float maxidx = (float)-1;
        idx = 0;

        // Recompute input positions based on padding
        if (SAME){
            input_row = i_kernel_row + i_row - padding;
            input_col = i_kernel_col + i_col - padding;
        } else {
            input_row = i_kernel_row + i_row;
            input_col = i_kernel_col + i_col;
        }

        // Check bounds after computing input positions
        if(input_row >= 0 && input_row < size && input_col >=0 && input_col < size){
            int output_idx = ((i_channel % in_channel) * size + input_col) * size + input_row;
            if (p_output[output_idx] > maxidx) {
                maxidx = p_output[output_idx];
                idx = output_idx;
            }
        }

        d_preact[idx] = nd_output[((i_channel % in_channel) * n_size + i_col) * n_size + i_row];
    }
}