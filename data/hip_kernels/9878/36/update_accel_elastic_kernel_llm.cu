#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_accel_elastic_kernel(float * accel, const float * veloc, const int size, const float two_omega_earth, const float * rmassx, const float * rmassy, const float * rmassz){
    // Calculate unique global thread ID
    int id = threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * gridDim.x * blockDim.x;

    if (id < size) {
        // Precompute index base for the current thread to reduce redundant calculations
        int idx3 = id * 3;

        // Update the acceleration with elimination of redundant calculations
        float vel_x = veloc[idx3];
        float vel_y = veloc[idx3 + 1];
        accel[idx3]     = accel[idx3] * rmassx[id] + two_omega_earth * vel_y;
        accel[idx3 + 1] = accel[idx3 + 1] * rmassy[id] - two_omega_earth * vel_x;
        accel[idx3 + 2] = accel[idx3 + 2] * rmassz[id];
    }
}