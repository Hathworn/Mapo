```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FillAdjacencyMatrix(float* adj_mat, float* maskBuffer, int size, int cols, int rows, int Nsegs) {
    // Calculate global index once
    int idx = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    int icol = idx % cols;
    int irow = idx / cols;

    // Ensure idx is within bounds and inside the effective area
    if (idx < size && icol < cols - 2 && icol > 1 && irow < rows - 2 && irow > 1) {
        int seg_id1 = maskBuffer[idx];
        
        // Check adjacency with right neighbor
        if (seg_id1 != maskBuffer[idx + 1]) {
            int seg_id2 = maskBuffer[idx + 1];
            // Set adjacency in both directions
            adj_mat[seg_id2 + seg_id1 * Nsegs] = 1;
            adj_mat[seg_id1 + seg_id2 * Nsegs] = 1;
        }
        // Check adjacency with upper neighbor
        else if (seg_id1 != maskBuffer[idx - cols]) {
            int seg_id2 = maskBuffer[idx - cols];
            // Set adjacency in both directions
            adj_mat[seg_id2 + seg_id1 * Nsegs] = 1;
            adj_mat[seg_id1 + seg_id2 * Nsegs] = 1;
        }
    }
}