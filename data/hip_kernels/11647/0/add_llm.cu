#include "hip/hip_runtime.h"
#include "includes.h"

#define N 10000000 //input data size: 10,000,000
#define BLOCKSIZE 1024

/* prefix sum */

using namespace std;

__global__ void add(double* in, double* out, int offset, int n) {

    int gid = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Check bounds before accessing memory to ensure thread safety
    if(gid < n) {
        // Sequential memory access; may improve coalescing
        double temp = in[gid];
        if(gid >= offset)
            temp += in[gid - offset];
        out[gid] = temp;
    }
}