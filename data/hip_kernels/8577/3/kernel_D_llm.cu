#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_D(float* _g_data, int dimx, int dimy) {
    float4* g_data = reinterpret_cast<float4*>(_g_data);

    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data from global to register for efficiency
    float4 value = g_data[id];

    // Optimize computation by storing repeated computations in variables
    float cos_val_x = cosf(value.x);
    float log_val_y = logf(value.y);
    float cos_val_z = cosf(value.z);
    float log_val_w = logf(value.w);

    // Perform calculations
    value.x += sqrtf(cos_val_x + 1.f);
    value.y += sqrtf(log_val_y + 1.f);
    value.z += sqrtf(cos_val_z + 1.f);
    value.w += sqrtf(log_val_w + 1.f);

    // Write results back to global memory
    g_data[id] = value;
}