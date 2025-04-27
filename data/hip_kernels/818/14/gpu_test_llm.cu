#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_test(unsigned char* Pout, unsigned char* Pin, int width, int height) {
    // Calculate global thread index in x and y direction
    int col = blockIdx.x * blockDim.x + threadIdx.x; 
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Check within image boundaries before writing
    if (row < height && col < width) {
        int i = row * width + col;  // Calculate index within linear memory
        Pout[i] = Pin[i];  // Copy data from Pin to Pout
    }
}