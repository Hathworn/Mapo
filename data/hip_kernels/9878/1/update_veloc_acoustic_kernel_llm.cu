#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_veloc_acoustic_kernel(float *veloc, const float *accel, const int size, const float deltatover2) {
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x; // Simplified id calculation

    if (id < size) {
        veloc[id] += deltatover2 * accel[id]; // Simplified velocity update
    }
}