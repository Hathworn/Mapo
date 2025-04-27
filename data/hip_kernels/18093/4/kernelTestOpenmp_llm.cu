#include "hip/hip_runtime.h"
#include "includes.h"
#define CUDAMAXTHREADPERBLOCK 1024
#define CUDAMAXBLOCK 65536

using namespace std;

__global__ void kernelTestOpenmp(int *dev_b, int tt){
    // Calculate thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread operates within bounds
    if (tid < tt) {
        if (dev_b[tid] != tid) {
            printf("no!!!\n");
        }
        printf("yes!!!!\n");
    }
}