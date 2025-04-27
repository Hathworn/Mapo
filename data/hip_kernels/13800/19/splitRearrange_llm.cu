#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void splitRearrange (int numElems, int iter, unsigned int* keys_i, unsigned int* keys_o, unsigned int* values_i, unsigned int* values_o, unsigned int* histo) {
    // Use shared memory for histogram and temporary arrays
    __shared__ unsigned int histo_s[(1<<BITS)];
    __shared__ unsigned int array_s[4*SORT_BS];

    int index = blockIdx.x*4*SORT_BS + 4*threadIdx.x;

    // Load histogram data to shared memory
    if (threadIdx.x < (1<<BITS)){
        histo_s[threadIdx.x] = histo[gridDim.x*threadIdx.x+blockIdx.x];
    }
    
    // Efficient conditional loading of data
    uint4 mine = {UINT32_MAX, UINT32_MAX, UINT32_MAX, UINT32_MAX};
    uint4 value;
    if (index < numElems) {
        mine = *((uint4*)(keys_i+index));
        value = *((uint4*)(values_i+index));
    }

    // Calculate masks
    uint4 masks = {
        (mine.x&((1<<(BITS*(iter+1)))-1))>>(BITS*iter),
        (mine.y&((1<<(BITS*(iter+1)))-1))>>(BITS*iter),
        (mine.z&((1<<(BITS*(iter+1)))-1))>>(BITS*iter),
        (mine.w&((1<<(BITS*(iter+1)))-1))>>(BITS*iter)
    };
    
    ((uint4*)array_s)[threadIdx.x] = masks;
    __syncthreads();

    // Use shared memory for histogram computations
    uint4 new_index = {histo_s[masks.x], histo_s[masks.y], histo_s[masks.z], histo_s[masks.w]};

    // Unroll loop for improving performance
    int i = 4*threadIdx.x - 1;
    if (i >= 0) {
        if (array_s[i] == masks.x) new_index.x++;
        i--;
    }
    if (i >= 0) {
        if (array_s[i] == masks.x) new_index.x++;
    }

    // Sequence the index increments
    new_index.y = (masks.y == masks.x) ? new_index.x+1 : new_index.y;
    new_index.z = (masks.z == masks.y) ? new_index.y+1 : new_index.z;
    new_index.w = (masks.w == masks.z) ? new_index.z+1 : new_index.w;

    // Efficiently write results back to global memory
    if (index < numElems){
        keys_o[new_index.x] = mine.x;
        values_o[new_index.x] = value.x;

        keys_o[new_index.y] = mine.y;
        values_o[new_index.y] = value.y;

        keys_o[new_index.z] = mine.z;
        values_o[new_index.z] = value.z;

        keys_o[new_index.w] = mine.w;
        values_o[new_index.w] = value.w;
    }
}