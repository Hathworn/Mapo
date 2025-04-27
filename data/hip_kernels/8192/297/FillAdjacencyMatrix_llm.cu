#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FillAdjacencyMatrix(float* adj_mat, float* maskBuffer, int size, int cols, int rows, int Nsegs) {
    int idx = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    if (idx >= size) return; // Early exit if idx is out of bounds

    int icol = idx % cols;
    int irow = idx / cols;
    
    if (icol >= cols - 2 || irow >= rows - 2 || irow <= 1 || icol <= 1) return; // Boundary check

    int seg_id1 = maskBuffer[idx];
    if (seg_id1 != maskBuffer[idx + 1]) {
        int seg_id2 = maskBuffer[idx + 1];
        adj_mat[seg_id2 + seg_id1 * Nsegs] = 1; // Record adjacency
        adj_mat[seg_id1 + seg_id2 * Nsegs] = 1; // Ensure symmetry
    } else if (seg_id1 != maskBuffer[idx - cols]) {
        int seg_id2 = maskBuffer[idx - cols];
        adj_mat[seg_id2 + seg_id1 * Nsegs] = 1; // Record adjacency
        adj_mat[seg_id1 + seg_id2 * Nsegs] = 1; // Ensure symmetry
    }
}