#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void suma_vectores(int* c, const int* a, const int* b, int size) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Load data from global memory into register
    if (i < size) {
        int temp_a = a[i];
        int temp_b = b[i];
        // Perform computation using registers
        c[i] = temp_a + temp_b;
    }
}