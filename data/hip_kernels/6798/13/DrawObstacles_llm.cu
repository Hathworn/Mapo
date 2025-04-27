#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DrawObstacles(uchar4 *ptr, int* indices, int size) {
    // Calculate global thread index
    int thread_id = threadIdx.x + blockIdx.x * blockDim.x;

    // Loop through elements using stride pattern for better memory access
    for (int i = thread_id; i < size; i += blockDim.x * gridDim.x) {
        int index = indices[i];
        ptr[index] = make_uchar4(0, 0, 0, 255); // Use efficient built-in function
    }
}