#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_reference_points_norm(float * array, int width, int pitch, int height, float * norm) {
    unsigned int tx = threadIdx.x;
    unsigned int ty = threadIdx.y;
    unsigned int xIndex = blockIdx.x * blockDim.x + tx;
    unsigned int yIndex = blockIdx.y * blockDim.y + ty;

    __shared__ float shared_vec[16]; // Optimize shared memory usage

    if (ty < 16 && tx == 0 && yIndex < height) { // Reduce if-statement complexity
        shared_vec[ty] = norm[yIndex];
    }
    __syncthreads();

    if (tx < width && xIndex < width && yIndex < height) { // Simplify bounds check
        array[yIndex * pitch + xIndex] += shared_vec[ty];
    }
}