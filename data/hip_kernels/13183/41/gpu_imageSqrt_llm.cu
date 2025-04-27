#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_imageSqrt(float * out, const float * in, const int width, const int height) {
    // Utilize shared memory for improved access speed
    __shared__ float localIn[blockDim.x * blockDim.y];
    
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    const int index = x + y * width;

    // Ensure thread index is within bounds
    if (x < width && y < height) {
        // Load data to shared memory and apply sqrt function
        localIn[threadIdx.y * blockDim.x + threadIdx.x] = in[index];
        __syncthreads();
        
        // Write output from shared memory to global memory
        out[index] = sqrtf(localIn[threadIdx.y * blockDim.x + threadIdx.x]);
    }
}