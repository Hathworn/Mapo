#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void initialize_clause_output_predict(int *clause_output, int *all_exclude)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use single condition to avoid branch divergence
    if(index < CLAUSES) {
        // Each thread initializes its own clause output
        clause_output[index] = 1;
        all_exclude[index] = 1;
    }
}