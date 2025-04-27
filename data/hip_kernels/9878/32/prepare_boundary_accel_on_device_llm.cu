#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prepare_boundary_accel_on_device(const float *d_accel, float *d_send_accel_buffer, const int num_interfaces, const int max_nibool_interfaces, const int *d_nibool_interfaces, const int *d_ibool_interfaces) {
    int id = threadIdx.x + blockIdx.x * blockDim.x + gridDim.x * blockDim.x * (threadIdx.y + blockIdx.y * blockDim.y);
  
    // Using shared memory to avoid thread divergence in loop
    __shared__ int shared_interfaces[32]; // Assume max interfaces are 32, adjust if needed
    
    for (int iinterface = threadIdx.x; iinterface < num_interfaces; iinterface += blockDim.x) {
        shared_interfaces[iinterface] = d_nibool_interfaces[iinterface];
    }
    __syncthreads();

    for (int iinterface = 0; iinterface < num_interfaces; iinterface++) {
        if (id < shared_interfaces[iinterface]) {
            int iloc = id + max_nibool_interfaces * iinterface;
            int iglob = d_ibool_interfaces[iloc] - 1;
            
            // Optimize memory access pattern
            int buffer_index = iloc * 3;
            int accel_index = iglob * 3;
            d_send_accel_buffer[buffer_index] = d_accel[accel_index];
            d_send_accel_buffer[buffer_index + 1] = d_accel[accel_index + 1];
            d_send_accel_buffer[buffer_index + 2] = d_accel[accel_index + 2];
        }
    }
}