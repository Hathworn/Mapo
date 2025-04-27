```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stdp_kernel( float *weight, int weight_size_0, int weight_size_1, int weight_size_2, int weight_size_3, float *output_spike, int output_spike_size_0, int output_spike_size_1, int output_spike_size_2, int output_spike_size_3, float *history, float *weight_update)
{
    // Calculate grid and thread indices
    const int batch_id = blockIdx.x;
    const int channel_id = threadIdx.x;
    const int height_id = blockIdx.y;
    const int width_id = blockIdx.z;

    // Calculate the linear index for output_spike
    const int linear_idx = (batch_id * output_spike_size_1 * output_spike_size_2 * output_spike_size_3) 
                            + (channel_id * output_spike_size_2 * output_spike_size_3) 
                            + (height_id * output_spike_size_3) 
                            + width_id;

    // Check the spike condition
    if (output_spike[linear_idx] != 1.0f) return;

    // Calculate some constants
    const int offset = weight_size_2 / 2;
    const int filter_index = channel_id * weight_size_1 * weight_size_2 * weight_size_3;
    const int delta_index_const = batch_id * weight_size_0 * weight_size_1 * weight_size_2 * weight_size_3;

    // Loop unrolling to maximize performance
    for (int l = 0; l < weight_size_1; l++) {
        int history_pivot = batch_id * weight_size_1 * output_spike_size_2 * output_spike_size_3 
                            + l * output_spike_size_2 * output_spike_size_3;
        int filter_2d_index = filter_index + l * weight_size_2 * weight_size_3;

        for (int i = 0; i < weight_size_2; i++) {
            int filter_1d_index = filter_2d_index + i * weight_size_3;
            int history_index1 = height_id + i - offset;
            
            // Skip invalid history indices
            if (history_index1 < 0 || history_index1 >= output_spike_size_2) continue;
            int history_1d_index = history_pivot + history_index1 * output_spike_size_3;

            for (int j = 0; j < weight_size_3; j++) {
                int history_index2 = width_id + j - offset;
                // Skip invalid history indices
                if (history_index2 < 0 || history_index2 >= output_spike_size_3) continue;
                int history_index = history_1d_index + history_index2;
                int w_index = filter_1d_index + j;
                int deltaW_index = delta_index_const + w_index;

                float input_tmp = history[history_index];
                // Compute weight update
                weight_update[deltaW_index] = (weight[w_index] * (1 - weight[w_index])) 
                                            * ((input_tmp != 0.0f) - (input_tmp == 0.0f));
            }
        }
    }
}