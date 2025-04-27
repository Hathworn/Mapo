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

__global__ void bitonic_sort_step(chromosome *cudanewpopulation, int j, int k)
{
    unsigned int i = threadIdx.x + blockDim.x * blockIdx.x;
    unsigned int ixj = i ^ j; // Calculate partner index

    // Only process valid elements
    if (ixj > i) {
        bool isDescending = (i & k) != 0; // Determine sorting order

        // Swap elements if in the wrong order
        if ((isDescending ? (cudanewpopulation[i].value < cudanewpopulation[ixj].value)
                          : (cudanewpopulation[i].value > cudanewpopulation[ixj].value))) {
            // Exchange elements
            chromosome temp = cudanewpopulation[i];
            cudanewpopulation[i] = cudanewpopulation[ixj];
            cudanewpopulation[ixj] = temp;
        }
    }
}