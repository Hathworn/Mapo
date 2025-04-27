#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void add_scalar_double(int n, int idx, double dx, double *dy, int incy, double *result) {
    // Calculate the global index for each thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = blockDim.x * gridDim.x; // Calculate total grid size
    
    while (i < n) { // Use while loop for grid-stride looping
        if (i >= idx && i % incy == 0) {
            result[i] = dy[i] + dx; // Perform the addition if conditions are met
        }
        i += gridSize; // Increment index by grid size for the next iteration
    }
}