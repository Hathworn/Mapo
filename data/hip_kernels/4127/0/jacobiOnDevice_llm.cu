#include "hip/hip_runtime.h"
#include "includes.h"

static char* program_name;

// Optimized kernel using shared memory
__global__ void jacobiOnDevice(float* x_next, float* A, float* x_now, float* b, int Ni, int Nj)
{
    extern __shared__ float shared_x_now[]; // Allocate shared memory for x_now

    int idx = threadIdx.x;
    if (idx < Nj) {
        shared_x_now[idx] = x_now[idx]; // Load x_now into shared memory
    }
    __syncthreads(); // Ensure all threads have loaded x_now to shared memory

    if (idx < Nj) {
        float sigma = 0.0;
        for (int j = 0; j < Nj; j++) {
            if (idx != j) {
                sigma += A[idx * Nj + j] * shared_x_now[j]; // Use shared memory
            }
        }
        x_next[idx] = (b[idx] - sigma) / A[idx * Nj + idx];
    }
}