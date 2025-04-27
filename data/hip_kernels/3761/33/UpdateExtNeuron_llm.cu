```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UpdateExtNeuron(float *port_input_pt, float *port_value_pt, int n_node, int n_var, int n_port_var, int n_port)
{
    int i_thread = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Check if the thread index is within bounds
    if (i_thread < n_node * n_port) {
        int i_port = i_thread % n_port; // Calculate port index
        int i_node = i_thread / n_port; // Calculate node index

        // Compute pointer to the input port value
        float *pip = port_input_pt + i_node * n_var + n_port_var * i_port;

        // Update the port value and reset input port value
        port_value_pt[i_node * n_var + n_port_var * i_port] = *pip;
        *pip = 0.0f; // Set input port to zero
    }
}