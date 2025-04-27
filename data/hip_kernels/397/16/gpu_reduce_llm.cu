#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_reduce(int *c, int size)
{
    // Calculate global thread index
    int position = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform reduction if within bounds
    if (position < size/2) {
        int offset = size % 2;
        
        // If array size is odd, compare with last element
        if (offset && (position == size/2 - 1)) {
            if (c[position] < c[size-1]) {
                c[position] = c[size-1];
            }
        } else {
            // Compare with corresponding element at position + size/2
            if (c[position] < c[position + size/2]) {
                c[position] = c[position + size/2];
            }
        }
    }
}