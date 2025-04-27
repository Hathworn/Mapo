#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updatePhi_kernel(int n, bool* d_flags, float* d_energy, float* d_fatigue, float theta) {
    // Calculate global index for the current thread
    unsigned int index = threadIdx.x + blockDim.x * blockIdx.x;
    // Loop through all elements with a stride equal to the total number of threads
    for (unsigned int stride = blockDim.x * gridDim.x; index < n; index += stride) {
        // Use ternary operator directly for simplicity
        d_flags[index] = (d_energy[index] - d_fatigue[index]) > theta;
    }
}