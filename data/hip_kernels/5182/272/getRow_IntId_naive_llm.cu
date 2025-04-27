#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getRow_IntId_naive(const float * A, int row_id, float * out, int Acols) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified and corrected index calculation
    if (id < Acols) {
        out[id] = A[id + row_id * Acols];
    }
}