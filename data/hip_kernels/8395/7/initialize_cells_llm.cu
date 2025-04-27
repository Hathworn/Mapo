#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function for initializing cells
__global__ void initialize_cells(CellT* __restrict__ dev_cells, CellT* __restrict__ dev_next_cells, int size_x, int size_y) {
    // Calculate the total number of threads
    int totalThreads = blockDim.x * gridDim.x;
    // Calculate the global thread index
    int idx = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Use a more efficient looping strategy with stride equal to total number of threads
    for (int i = idx; i < size_x * size_y; i += totalThreads) {
        dev_cells[i] = 0;
        dev_next_cells[i] = 0;
    }
}