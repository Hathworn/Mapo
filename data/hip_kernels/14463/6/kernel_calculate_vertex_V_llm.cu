```c
#include "hip/hip_runtime.h"
#include "includes.h"

// ==== CONSTANTS ====

__constant__ unsigned int d_L;
__constant__ float d_dx;
__constant__ float d_dt;
__constant__ float d_mass;
__constant__ float d_g;
__constant__ unsigned int d_t;

__constant__ float d_scaling;
__constant__ int d_current_scene;

// ==== INITIALIZATION ====

__global__ void kernel_calculate_vertex_V(float3* vbo_ptr, float* d_ptr) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    if (i < d_L && j < d_L) {
        // Optimize memory access by computing index once and reusing
        int index = d_L * i + j;
        vbo_ptr[index].y = d_scaling * fabsf(d_ptr[index]) - 0.005f * d_L;
    }
}