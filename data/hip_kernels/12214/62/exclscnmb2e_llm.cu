#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void exclscnmb2e(int *d_data0, int *d_output0, int *d_data1, int *d_output1, int *d_data2, int *d_output2, int *d_data3, int *d_output3, int *d_data4, int *d_output4, int *d_data5, int *d_output5, int *d_data6, int *d_output6, int *d_data7, int *d_output7) {
    const int twid = threadIdx.x;
    int *d_data, *d_output;
    
    // Directly map block index to data and output arrays
    switch (blockIdx.x) {
        case 0: d_data = d_data0; d_output = d_output0; break;
        case 1: d_data = d_data1; d_output = d_output1; break;
        case 2: d_data = d_data2; d_output = d_output2; break;
        case 3: d_data = d_data3; d_output = d_output3; break;
        case 4: d_data = d_data4; d_output = d_output4; break;
        case 5: d_data = d_data5; d_output = d_output5; break;
        case 6: d_data = d_data6; d_output = d_output6; break;
        case 7: d_data = d_data7; d_output = d_output7; break;
        default: return; // Return early if block index is out of bounds
    }

    // Perform computation only if within bounds
    if (twid < 2) {
        d_output[twid] = d_data[0] * twid;
    }
}