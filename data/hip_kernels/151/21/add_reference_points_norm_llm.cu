#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_reference_points_norm(float * array, int width, int pitch, int height, float * norm){
    unsigned int tx = threadIdx.x;
    unsigned int ty = threadIdx.y;
    unsigned int xIndex = blockIdx.x * blockDim.x + tx;
    unsigned int yIndex = blockIdx.y * blockDim.y + ty;
    
    // Use dynamic shared memory to adaptively allocate based on block dimensions
    extern __shared__ float shared_vec[];
    
    // Load norm into shared memory efficiently
    if (tx == 0 && yIndex < height) {
        shared_vec[ty] = norm[yIndex];
    }
    __syncthreads();

    // Perform addition only within bounds
    if (xIndex < width && yIndex < height) {
        array[yIndex * pitch + xIndex] += shared_vec[ty];
    }
}