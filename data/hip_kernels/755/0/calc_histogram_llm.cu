#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calc_histogram(char* dbuff, unsigned int* dcount, unsigned int size, float stride) {

    unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int start_pos = stride * index;
    unsigned int stop_pos = min(start_pos + stride, size); // Use min to avoid overflow
    unsigned int lcount[10] = { 0 };

    for (unsigned int i = start_pos; i < stop_pos; i++) {
        // Use a switch-case to efficiently increment the counter
        switch (dbuff[i]) {
            case '0': lcount[0]++; break;
            case '1': lcount[1]++; break;
            case '2': lcount[2]++; break;
            case '3': lcount[3]++; break;
            case '4': lcount[4]++; break;
            case '5': lcount[5]++; break;
            case '6': lcount[6]++; break;
            case '7': lcount[7]++; break;
            case '8': lcount[8]++; break;
            case '9': lcount[9]++; break;
        }
    }

    // Use atomicAdd to safely update global counter with local count
    atomicAdd(&dcount[0], lcount[0]);
    atomicAdd(&dcount[1], lcount[1]);
    atomicAdd(&dcount[2], lcount[2]);
    atomicAdd(&dcount[3], lcount[3]);
    atomicAdd(&dcount[4], lcount[4]);
    atomicAdd(&dcount[5], lcount[5]);
    atomicAdd(&dcount[6], lcount[6]);
    atomicAdd(&dcount[7], lcount[7]);
    atomicAdd(&dcount[8], lcount[8]);
    atomicAdd(&dcount[9], lcount[9]);
}