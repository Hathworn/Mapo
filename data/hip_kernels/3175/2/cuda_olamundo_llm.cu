#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel with grid-stride loop for better scalability
__global__ void cuda_olamundo() {
    // Calculate unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a grid-stride loop to handle more threads if needed
    for (int i = idx; i < 1; i += gridDim.x * blockDim.x) {
        printf("Ola Mundo direto da GPU!\n");
    }
}