```c
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int position;            // index of the largest value
__device__ int largest;             // value of the largest value
int lenString = 593;
int maxNumStrings = 1000000;
int threshold = 2;

__global__ void anyLeft(int *d_c, int *remaining, int size) {
    // Calculate unique thread index
    int my_id = blockDim.x * blockIdx.x + threadIdx.x;

    // Check bounds and update only if it remains greater
    if (my_id < size && d_c[my_id] == 0) {
        // Atomically set remaining to 0 to ensure only one operation
        atomicExch(remaining, 0);
    }
}