#include "hip/hip_runtime.h"
#include "includes.h"
#define N 50
#define NewN 100

#define LifeN 500
#define numofthreads 512
int numofeles=0, capacity;

struct chromosome
{
    long long weight = 0, value = 0;
    bool chromo[100003];
};
chromosome chromoele[N], *cudaChromo, *cudaNewpopulation, newpopulation[NewN], res, x[2];
int weight[100001], value[100001], *devValue, *devWeight, *devnumeles;

// Optimized global kernel function
__global__ void gan(chromosome *cudaChromo, chromosome *cudaNewpopulation, const int capacity)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < N) {
        chromosome bestChromo = cudaChromo[idx]; // Store best chromosome locally
        for (int i = idx; i < NewN; i += N) {
            chromosome candidate = cudaNewpopulation[i];
            if (candidate.weight <= capacity && candidate.value > bestChromo.value) {
                bestChromo = candidate; // Update best chromosome locally
            }
        }
        cudaChromo[idx] = bestChromo; // Write back the best chromosome
    }
}