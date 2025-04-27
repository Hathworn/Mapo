#include "hip/hip_runtime.h"
#include "includes.h"
#define N 50
#define NewN 100

#define LifeN 500
#define numofthreads 512
int numofeles=0, capacity;

struct chromosome
{
    long long weight=0, value=0;
    bool chromo[100003];
};
chromosome chromoele[N], *cudaChromo, *cudaNewpopulation, newpopulation[NewN], res, x[2];
int weight[100001], value[100001], *devValue, *devWeight, *devnumeles;

__global__ void initpopulation(chromosome *cudaChromo, int seed, const int numofeles, int *devValue, int *devWeight)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Ensure index is within the valid range
    if (blockIdx.x < N && idx < numofeles) {
        hiprandState state;
        // Use unique thread index for seed initialization
        hiprand_init(seed, idx, 0, &state);
        // Directly assign random boolean
        cudaChromo[blockIdx.x].chromo[idx] = hiprand(&state) & 1;
    }
}