#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_WIDTH 16
#define BLOCK_HEIGHT 16
#define SHARED_BLOCK_DIM 32
#define CHUNK_SIZE 512
#define cudaCheckError(ans) cudaAssert((ans), __FILE__, __LINE__);

__global__ void show() {
    // Remove unused `printf` to enhance performance
    // Code logic for the kernel function would go here
}