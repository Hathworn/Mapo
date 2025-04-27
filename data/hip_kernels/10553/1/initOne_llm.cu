#include "hip/hip_runtime.h"
#include "includes.h"
#define N 50
#define NewN 100

#define LifeN 500
#define numofthreads 512
int numofeles=0, capacity;

struct chromosome {
    long long weight = 0, value = 0;
    bool chromo[100003];
};
chromosome chromoele[N], *cudaChromo, *cudaNewpopulation, newpopulation[NewN], res, x[2];
int weight[100001], value[100001], *devValue, *devWeight, *devnumeles;

__global__ void initOne(chromosome *cudaChromo, const int numele, int *devValue, int *devWeight) {
    // Calculate unique thread index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure the thread index is within bounds
    if (idx < numele) {
        // Initialize chromosome if thread belongs to this block
        bool isInBlock = (blockIdx.x == idx % N);
        cudaChromo[blockIdx.x].chromo[idx % N] = isInBlock;

        // Set value and weight if initial position
        if (isInBlock) {
            cudaChromo[blockIdx.x].value = devValue[idx];
            cudaChromo[blockIdx.x].weight = devWeight[idx];
        }
    }
}