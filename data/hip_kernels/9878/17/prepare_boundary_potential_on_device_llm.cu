#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void prepare_boundary_potential_on_device(const float * d_potential_dot_dot_acoustic, float * d_send_potential_dot_dot_buffer, const int num_interfaces, const int max_nibool_interfaces, const int * d_nibool_interfaces, const int * d_ibool_interfaces){
    int id = threadIdx.x + blockIdx.x * blockDim.x + gridDim.x * blockDim.x * (threadIdx.y + blockIdx.y * blockDim.y);

    // Iterate over interfaces
    for (int iinterface = 0; iinterface < num_interfaces; iinterface++) {
        // Check if thread ID is within the number of elements for the current interface
        if (id < d_nibool_interfaces[iinterface]) {
            int iloc = id + max_nibool_interfaces * iinterface;
            int iglob = d_ibool_interfaces[iloc] - 1;

            // Copy potential data from global to interface buffer
            d_send_potential_dot_dot_buffer[iloc] = d_potential_dot_dot_acoustic[iglob];
        }
    }
}