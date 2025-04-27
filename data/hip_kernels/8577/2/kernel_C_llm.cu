#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_C(float* _g_data, int dimx, int dimy) {
    // Use shared memory for values being accessed by multiple threads
    extern __shared__ float2 shared_data[];

    float2* g_data = reinterpret_cast<float2*>(_g_data);
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Load global memory to shared memory
    shared_data[threadIdx.x] = g_data[id];

    // Ensure all threads have loaded their data
    __syncthreads();

    // Process data from shared memory
    float2 value = shared_data[threadIdx.x];
    value.x += sqrtf(cosf(value.x) + 1.f);
    value.y += sqrtf(logf(value.y) + 1.f);

    // Write back to global memory from shared memory
    g_data[id] = value;
}