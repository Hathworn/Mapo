#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int position;            // index of the largest value
__device__ int largest;             // value of the largest value
int lenString = 593;
int maxNumStrings = 1000000;
int threshold = 2;

__global__ void populate(int *d_b, int *copy_db, int *d_c, int size, int *left) {

    // Use shared memory for efficiency if needed (not shown here as it's not necessary for current ops)
    extern __shared__ int shared_mem[];

    // Calculate unique thread index
    int my_id = blockDim.x * blockIdx.x + threadIdx.x;

    // Initialize left only once by the first thread
    if (my_id == 0) *left = 1;    

    // Ensure only valid threads access memory
    if (my_id < size) {
        // Perform operations and update the copy
        int n = abs((bool)d_c[my_id] - 1);
        copy_db[my_id] = d_b[my_id] * n;
    }
}