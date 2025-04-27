#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void roadCrossingsKernel(int rows, int segs, int* adjacency, int* cross) {

    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread index is within bounds
    if (idx < rows) {

        // Initialize crossing count to zero
        int sum = 0;

        // Unroll loop to reduce loop overhead and improve performance
        for (int ii = 0; ii < segs; ii++) {
            sum += adjacency[idx * segs + ii];
        }

        // Store the sum result directly in output array
        cross[idx] = sum;
    }
}