#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Compute_Path(int *Md, const int Width, const int k)
{
    // Calculate global thread coordinates
    int ROW = blockIdx.x * blockDim.x + threadIdx.x;

    // Check within bounds
    if (ROW < Width) {
        // Pre-compute reused index values
        int index_row_k = ROW * Width + k;
        int index_k_col = k * Width + threadIdx.x;

        // Fetch values once to optimize memory access
        int md_row_k = Md[index_row_k];
        int md_k_col = Md[index_k_col];
        int md_row_col = Md[ROW * Width + threadIdx.x];

        // Update in-place only if condition is met
        if (md_row_col > md_row_k + md_k_col) {
            Md[ROW * Width + threadIdx.x] = md_row_k + md_k_col;
        }
    }
}