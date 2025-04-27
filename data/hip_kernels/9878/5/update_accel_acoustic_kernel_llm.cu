```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_accel_acoustic_kernel(float *accel, const int size, const float *rmass) {
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Ensure this thread processes within bounds
    if (id < size) {
        // Update acceleration with reciprocal mass
        accel[id] *= rmass[id];
    }
}