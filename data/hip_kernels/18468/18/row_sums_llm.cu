#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void row_sums(const float *A, float *sums, size_t ds) {
    int idx = threadIdx.x + blockDim.x * blockIdx.x; // create typical 1D thread index from built-in variables
    
    if (idx < ds) {
        float sum = 0.0f;
        
        // Use coalesced memory access by unrolling the loop
        int i = 0;
        for (; i + 3 < ds; i += 4) {
            sum += A[idx * ds + i];
            sum += A[idx * ds + i + 1];
            sum += A[idx * ds + i + 2];
            sum += A[idx * ds + i + 3];
        }

        // Handle remaining elements
        for (; i < ds; i++) {
            sum += A[idx * ds + i];
        }

        sums[idx] = sum;
    }
}