#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void column_sums(const float *A, float *sums, size_t ds) {
    int idx = threadIdx.x + blockDim.x * blockIdx.x; // create typical 1D thread index from built-in variables
    if (idx < ds) {
        float sum = 0.0f;
        A += idx; // Pointer offset to start at column
        // Unroll loop to improve performance
        for (size_t i = 0; i < ds; i += 4) {
            sum += A[ds * i];
            if (i + 1 < ds) sum += A[ds * (i + 1)];
            if (i + 2 < ds) sum += A[ds * (i + 2)];
            if (i + 3 < ds) sum += A[ds * (i + 3)];
        }
        sums[idx] = sum;
    }
}