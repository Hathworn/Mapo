#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int position;  // index of the largest value
__device__ int largest;   // value of the largest value
int lenString = 593;
int maxNumStrings = 1000000;
int threshold = 2;

__global__ void compare(char *d_a, int *d_b, int *d_c, int size, int lenString, int threshold) {
    int my_id = blockDim.x * blockIdx.x + threadIdx.x;

    if (my_id < size) {
        int diffs = 0;

        if (my_id == position) {
            d_c[my_id] = 2;
        } else if (d_c[my_id] == 0) {
            // Optimize loop access by working with pointers directly
            char *target = d_a + (lenString * position);
            char *current = d_a + (my_id * lenString);

            for (int x = 0; x < lenString; x++) {
                diffs += (bool)(target[x] ^ current[x]);
                if (diffs > threshold) 
                    break;  // Exit early if threshold is exceeded
            }

            if (diffs <= threshold) {
                atomicAdd(&d_b[position], d_b[my_id]);  // Ensure atomic operation for thread safety
                d_c[my_id] = 1;
            }
        }
    }
}