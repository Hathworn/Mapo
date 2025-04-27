#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#define TILE 16

__global__ void scaleIndex(double *matrix, int n, int index){
    // Calculate the thread's position within the row
    int thread_idx = threadIdx.x + blockDim.x * blockIdx.x;

    // Calculate the starting and ending positions for this row
    int start = index * n + index;
    int end = index * n + n;

    // Loop with stride to handle large matrices
    for (int i = start + 1 + thread_idx; i < end; i += blockDim.x * gridDim.x) {
        matrix[i] = (matrix[i] / matrix[start]);
    }
}