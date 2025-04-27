#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_potential_kernel(float * potential_acoustic, float * potential_dot_acoustic, float * potential_dot_dot_acoustic, const int size, const float deltat, const float deltatsqover2, const float deltatover2) {
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    if (id < size) {
        // Update potential values
        float dot_acoustic = potential_dot_acoustic[id];
        float dot_dot_acoustic = potential_dot_dot_acoustic[id];
        
        potential_acoustic[id] += deltat * dot_acoustic + deltatsqover2 * dot_dot_acoustic;
        potential_dot_acoustic[id] += deltatover2 * dot_dot_acoustic;
        potential_dot_dot_acoustic[id] = 0.0f;
    }
}