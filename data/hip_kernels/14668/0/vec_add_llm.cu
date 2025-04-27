#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_add(int* A, int* B, int* C, int size) {
    // Utilize a stride loop to enhance memory coalescing and allow for larger problem sizes
    for (int index = threadIdx.x + blockIdx.x * blockDim.x; index < size; index += blockDim.x * gridDim.x) {
        C[index] = A[index] + B[index];
    }
}