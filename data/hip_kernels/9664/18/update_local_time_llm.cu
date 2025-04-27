#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_local_time(int *next, double *local_time, double GTIME) {
    unsigned int gtid = blockIdx.x * blockDim.x + threadIdx.x;
    int who = next[gtid];

    // Use branchless method to update local time when 'who' is valid
    if (who >= 0) {
        local_time[who] = GTIME;
    }
}