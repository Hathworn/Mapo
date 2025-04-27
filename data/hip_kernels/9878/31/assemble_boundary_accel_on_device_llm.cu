#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void assemble_boundary_accel_on_device(float * d_accel, const float * d_send_accel_buffer, const int num_interfaces, const int max_nibool_interfaces, const int * d_nibool_interfaces, const int * d_ibool_interfaces) {
    int id = threadIdx.x + blockDim.x * (threadIdx.y + blockDim.y * blockIdx.y) + blockDim.x * blockDim.y * blockDim.z * blockIdx.x; // Simplified global thread ID calculation
    if(id >= max_nibool_interfaces * num_interfaces) return; // Boundary check

    int iinterface = id / max_nibool_interfaces; // Calculate interface index
    int local_id = id % max_nibool_interfaces; // Calculate local index in the interface

    if (local_id < d_nibool_interfaces[iinterface]) {
        int iloc = local_id + max_nibool_interfaces * iinterface;
        int iglob = d_ibool_interfaces[iloc] - 1;

        // Use direct indexing for atomic additions
        atomicAdd(&d_accel[iglob * 3 + 0], d_send_accel_buffer[iloc * 3 + 0]);
        atomicAdd(&d_accel[iglob * 3 + 1], d_send_accel_buffer[iloc * 3 + 1]);
        atomicAdd(&d_accel[iglob * 3 + 2], d_send_accel_buffer[iloc * 3 + 2]);
    }
}