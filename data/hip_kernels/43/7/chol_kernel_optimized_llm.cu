#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void chol_kernel_optimized(float * U, int k, int stride) {
    // Define the number of rows as a constant to avoid recalculating
    const unsigned int num_rows = MATRIX_SIZE;
    
    // Calculate the iteration index for i using block index
    const int i = blockIdx.x + (k + 1);
    
    // Calculate initial j index for this thread and stride step
    const int jstart = threadIdx.x + i;
    const int jstep = stride;
    
    // Limit check bounds for j
    const int jtop = num_rows - 1;
    const int jbottom = i;

    // Using register variables for frequently accessed U elements
    float Uk_i = U[k * num_rows + i];
    
    // Loop with stride for j
    for (int j = jstart; (j >= jbottom) && (j <= jtop); j += jstep) {
        U[i * num_rows + j] -= Uk_i * U[k * num_rows + j];
    }
}