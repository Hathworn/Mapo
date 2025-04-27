#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int position;			// index of the largest value
__device__ int largest;				// value of the largest value
int lenString = 593;
int maxNumStrings = 1000000;
int threshold = 2;

__global__ void search(int *d_b, int *d_c, int size) {
    int my_id = blockDim.x * blockIdx.x + threadIdx.x;
    if (my_id < size) {  // Ensure my_id is within bounds
        if ((d_c[my_id] == 0) && (d_b[my_id] == largest)) {
            position = my_id;
        }
    }
}