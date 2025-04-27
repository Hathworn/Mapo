#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GetSpikes(double *spike_array, int array_size, int n_port, int n_var, float *port_weight_arr, int port_weight_arr_step, int port_weight_port_step, float *port_input_arr, int port_input_arr_step, int port_input_port_step)
{
    int i_array = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Avoid unnecessary calculations for out-of-bounds threads
    if (i_array >= array_size * n_port) return;
    
    int i_target = i_array % array_size;
    int port = i_array / array_size;
    int port_input = i_target * port_input_arr_step + port_input_port_step * port;
    int port_weight = i_target * port_weight_arr_step + port_weight_port_step * port;
    
    // Preloading values into registers
    float input_val = port_input_arr[port_input];
    double spike_val = (double)spike_array[i_array];
    float weight_val = port_weight_arr[port_weight];
    
    // Computing the result
    double d_val = spike_val + input_val * weight_val;
    
    // Storing the result back
    port_input_arr[port_input] = (float)d_val;
}