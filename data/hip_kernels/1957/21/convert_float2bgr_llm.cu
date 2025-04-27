#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convert_float2bgr(float* annd, unsigned char* bgr, int w, int h)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure all threads in block have data stored in shared memory
    __shared__ float shared_annd[1024]; // example size; may need tuning for specific block size

    if (x < w && y < h)
    {
        int id = y * w + x;
        
        // Load to shared memory
        shared_annd[threadIdx.y * blockDim.x + threadIdx.x] = annd[id];
        __syncthreads();

        // Perform computation using shared memory
        int err = max(min((shared_annd[threadIdx.y * blockDim.x + threadIdx.x] + 1.f), 1.f), 0.f) * 255.f;

        // Store computed value
        bgr[id] = err;
    }
}