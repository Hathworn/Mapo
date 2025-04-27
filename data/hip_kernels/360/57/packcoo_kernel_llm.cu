#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void packcoo_kernel(int num_entries, int* row_indices, int* column_indices, int* aggridx, int* partidx, int* partlabel)
{
    // Calculate global thread index
    int entryidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread is within bounds
    if(entryidx < num_entries)
    {
        int row = row_indices[entryidx];
        int col = column_indices[entryidx];
        int l = partlabel[row];

        // Cache partstart to avoid multiple memory accesses 
        int partstart = aggridx[partidx[l]];

        // Use bitwise operations efficiently
        unsigned int newindex = (row - partstart) << 16 | (col - partstart);

        // Store computed newindex back to row_indices
        row_indices[entryidx] = newindex;
    }
}