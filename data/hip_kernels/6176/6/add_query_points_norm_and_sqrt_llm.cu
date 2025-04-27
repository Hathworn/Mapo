#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void add_query_points_norm_and_sqrt(float *array, int width, int pitch, int k, float *norm) {
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int yIndex = blockIdx.y * blockDim.y + threadIdx.y;

    if (xIndex < width && yIndex < k) {
        int index = yIndex * pitch + xIndex;  // Calculate index once for reuse
        float value = array[index] + norm[xIndex];  // Pre-calculate repeated expressions
        array[index] = sqrt(value);  // Assign square root of the calculated value
    }
}