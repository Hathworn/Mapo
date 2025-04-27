#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GetSpikes(double *spike_array, int array_size, int n_port, int n_var, float *port_weight_arr, int port_weight_arr_step, int port_weight_port_step, float *port_input_arr, int port_input_arr_step, int port_input_port_step)
{
    // Calculate global indices once to improve efficiency
    int i_target = blockIdx.x * blockDim.x + threadIdx.x;
    int port = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds to prevent out-of-bounds memory access
    if (i_target < array_size && port < n_port) {
        // Combine index calculations to reduce redundancy
        int i_array = port * array_size + i_target;
        int port_input = i_target * port_input_arr_step + port_input_port_step * port;
        int port_weight = i_target * port_weight_arr_step + port_weight_port_step * port;

        // Use registers directly to avoid repeated global memory access
        double input_value = (double)port_input_arr[port_input];
        double spike_value = spike_array[i_array];
        double weight_value = port_weight_arr[port_weight];

        // Perform computation using local variables
        double d_val = input_value + spike_value * weight_value;

        // Store result back to global memory
        port_input_arr[port_input] = (float)d_val;
    }
}