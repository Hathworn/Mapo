#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_disp_veloc_kernel(float * displ, float * veloc, float * accel, const int size, const float deltat, const float deltatsqover2, const float deltatover2) {
    // Calculate global thread ID in a 1D grid configuration
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Ensure thread operates only within bounds
    if (id < size) {
        // Update displacement using current velocity and acceleration
        displ[id] += deltat * veloc[id] + deltatsqover2 * accel[id];
        // Update velocity using current acceleration
        veloc[id] += deltatover2 * accel[id];
        // Reset acceleration to zero
        accel[id] = 0.0f;
    }
}