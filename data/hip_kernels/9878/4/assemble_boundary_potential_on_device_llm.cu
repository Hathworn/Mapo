#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void assemble_boundary_potential_on_device(float * d_potential_dot_dot_acoustic, const float * d_send_potential_dot_dot_buffer, const int num_interfaces, const int max_nibool_interfaces, const int * d_nibool_interfaces, const int * d_ibool_interfaces) {
    // Calculate unique thread ID
    int id = threadIdx.x + blockIdx.x * blockDim.x + gridDim.x * blockDim.x * (threadIdx.y + blockIdx.y * blockDim.y);
    
    // Loop over interfaces
    for (int iinterface = 0; iinterface < num_interfaces; iinterface++) {
        if (id < d_nibool_interfaces[iinterface]) {
            // Calculate local and global indices
            int iloc = id + max_nibool_interfaces * iinterface;
            int iglob = d_ibool_interfaces[iloc] - 1;
            // Safely add to global memory using atomic operation
            atomicAdd(&d_potential_dot_dot_acoustic[iglob], d_send_potential_dot_dot_buffer[iloc]);
        }
    }
}