#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void floor_float(int n, int idx, float *dy, int incy, float *result) {
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure all threads exit if exceeding the number of elements to process
    if (i < n && i >= idx && i % incy == 0) {
        // Perform the floor operation if within bounds and meets criteria
        result[i] = floorf(dy[i]);  // Use floorf for float for better performance
    }
}