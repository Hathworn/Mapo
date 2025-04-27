#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_mul(char* newB, char* first, char* second, int size_first, int size_second, int* size_newB) {
    // Use blockIdx.x and blockIdx.y for grid-based indexing
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int j = threadIdx.y + blockIdx.y * blockDim.y;

    int tid = j * gridDim.x * blockDim.x + i;

    // Bounds check to ensure valid accesses
    if (i < size_first && j < size_second) {
        if (j != 0 || i != 0) {  // Corrected logic for first element
            newB[tid] = first[i] * second[j];
        } else {
            newB[0] = (first[j] != second[i]) ? '-' : '+';
        }
    }
}