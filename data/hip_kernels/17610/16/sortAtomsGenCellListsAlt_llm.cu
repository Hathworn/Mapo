```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sortAtomsGenCellListsAlt(unsigned int natoms, const float4 *xyzr_d, const float4 *color_d, const unsigned int *atomIndex_d, unsigned int *sorted_atomIndex_d, const unsigned int *atomHash_d, float4 *sorted_xyzr_d, float4 *sorted_color_d, uint2 *cellStartEnd_d) {
    extern __shared__ unsigned int hash_s[]; // blockSize + 1 elements
    unsigned int index = (blockIdx.x * blockDim.x) + threadIdx.x;
    unsigned int hash;

    // Load the hash and initialize shared memory
    if (index < natoms) {
        hash = atomHash_d[index];
        hash_s[threadIdx.x+1] = hash;
        if (index > 0 && threadIdx.x == 0) {
            hash_s[0] = atomHash_d[index-1];
        }
    }

    __syncthreads();

    if (index < natoms) {
        // Check if it's the start of a new cell and set boundaries
        if (index == 0 || hash != hash_s[threadIdx.x]) {
            cellStartEnd_d[hash].x = index;
            if (index > 0)
                cellStartEnd_d[hash_s[threadIdx.x]].y = index;
        }

        if (index == natoms - 1) {
            cellStartEnd_d[hash].y = index + 1;
        }

        // Reorder atoms according to sorted indices
        unsigned int sortedIndex = atomIndex_d[index];
        sorted_atomIndex_d[sortedIndex] = index;
        sorted_xyzr_d[index] = xyzr_d[sortedIndex];

        // Reorder colors according to sorted indices, if provided
        if (color_d != NULL) {
            sorted_color_d[index] = color_d[sortedIndex];
        }
    }
}