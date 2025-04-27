#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void filterKernel(unsigned char* data, unsigned width, unsigned height, unsigned hStride, unsigned vStride, bool wrapAround) {
    // Compute column index based on block and thread
    unsigned columnId = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if column index is within bounds
    if (columnId < width) {
        // Calculate starting point of the column in the data
        unsigned char* colp = data + columnId * hStride;
        unsigned step = width * hStride * vStride;

        // Initialize previous element for current column
        uint32_t prev = colp[step];
        uint32_t pprev = wrapAround ? colp[step * (height - 1)] : prev;
        
        // Update the first element of column with boundary condition
        uint32_t v = colp[0];
        colp[0] = (2 * v + pprev + prev) >> 2;

        // Synchronize all threads in a block
        __syncthreads();

        // Loop through each row and apply filter
        for (unsigned row = 2; row < height; row += 2) {
            // Load next element in the column
            uint32_t next = colp[step * (row + 1)];
            uint32_t v = colp[step * row];
            
            // Update current row element
            colp[step * row] = (2 * v + next + prev) >> 2;
            
            // Set current element as previous for next iteration
            prev = next;
        }
    }
}