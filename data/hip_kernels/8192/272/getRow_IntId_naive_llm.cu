#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void getRow_IntId_optimized(const float * A, int row_id, float * out, int Acols) {
// Efficient calculation of global thread ID using gridDim.x
int id = blockIdx.x * blockDim.x + threadIdx.x;
// Ensure threads within bounds of Acols
if (id < Acols) {
    // Directly access row elements
    out[id] = A[id + row_id * Acols];
}
}