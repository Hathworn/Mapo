#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void oddeven(int* x, int I, int n)
{
    // Calculate the global thread index for more flexibility
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory for faster access within a block, allocate space accordingly
    extern __shared__ int shared[];
    
    // Load data from global memory to shared memory
    if (2 * id < n) {
        shared[2 * id] = x[2 * id];
        if (2 * id + 1 < n) {
            shared[2 * id + 1] = x[2 * id + 1];
        }
    }
    __syncthreads();

    // Perform swap for even phase
    if (I == 0 && 2 * id + 1 < n) {
        if (shared[2 * id] > shared[2 * id + 1]) {
            int temp = shared[2 * id];
            shared[2 * id] = shared[2 * id + 1];
            shared[2 * id + 1] = temp;
        }
    }
    // Perform swap for odd phase
    if (I == 1 && 2 * id + 2 < n) {
        if (shared[2 * id + 1] > shared[2 * id + 2]) {
            int temp = shared[2 * id + 1];
            shared[2 * id + 1] = shared[2 * id + 2];
            shared[2 * id + 2] = temp;
        }
    }
    __syncthreads();

    // Store data back to global memory
    if (2 * id < n) {
        x[2 * id] = shared[2 * id];
        if (2 * id + 1 < n) {
            x[2 * id + 1] = shared[2 * id + 1];
        }
    }
}