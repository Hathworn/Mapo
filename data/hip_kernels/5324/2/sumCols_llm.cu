#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void sumCols(int* d_matrix, int* d_result, int numRows, int numCols) {
    // Calculate unique column index for each thread
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure thread index is within valid range
    if (idx < numCols) {
        int sum = 0;

        // Accumulate column sums
        for (int i = 0; i < numRows; i++) {
            sum += d_matrix[idx + (numCols * i)];
        }

        // Store computed sum in the result array
        d_result[idx] = sum;
    }
}