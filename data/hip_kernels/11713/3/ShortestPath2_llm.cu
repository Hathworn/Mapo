#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ShortestPath2(float *Arr1, float *Arr2, float *recv, int N, int rows, int k, int rank, int owner) {
    // Compute row and column for the current thread
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    if (col < N && row < rows) {  // Bounds checking to prevent out-of-bounds access
        int index = row * N + col;
        int index_ik = row * N + k;

        // Conditional update of Arr2 based on path comparison
        float potential_new_distance = Arr1[index_ik] + recv[col];
        if (Arr1[index] > potential_new_distance) {
            Arr2[index] = potential_new_distance;
        }
    }
}