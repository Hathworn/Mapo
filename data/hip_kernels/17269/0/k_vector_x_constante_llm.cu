#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

void print_function(int*, int);

// Programando Tarjeta//

__global__ void k_vector_x_constante(int* arr, int* answer, int n, int k) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use shared memory for caching if array size permits
    extern __shared__ int shared_mem[];
    if (idx < n) {
        shared_mem[threadIdx.x] = arr[idx];  // Load into shared memory
        __syncthreads();  // Synchronize to ensure all threads have loaded their elements
        answer[idx] = shared_mem[threadIdx.x] * k;  // Perform computation
    }
}