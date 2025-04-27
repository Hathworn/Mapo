#include "hip/hip_runtime.h"
#include "includes.h"
#define N 50
#define NewN 100

#define LifeN 500
#define numofthreads 512
int numofeles=0,capacity;

struct chromosome
{
    long long weight=0, value=0;
    bool chromo[100003];
};
chromosome chromoele[N],*cudaChromo,*cudaNewpopulation,newpopulation[NewN],res,x[2];
int weight[100001],value[100001],*devValue,*devWeight,*devnumeles;

__global__ void hybrid(chromosome *cudaChromo, chromosome *cudaNewpopulation, int seed1, const int numele, int *devValue, int *devWeight)
{
    // Calculate global index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Limit processing within NewN elements
    if (idx < NewN) {
        hiprandState state;
        // Initialize the HIP random number generator
        hiprand_init(seed1, idx, 0, &state);
        
        // Generate random seeds for selection
        int seed2 = hiprand(&state) % N;
        int seed3 = hiprand(&state) % numele;

        // Copy chromosome data
        cudaNewpopulation[idx] = cudaChromo[idx % N];

        if (idx < NewN - N) {
            // Apply genetic operations for the main segment
            if (cudaNewpopulation[idx].chromo[seed3]) {
                // Reduce value and weight if chromo is true
                cudaNewpopulation[idx].value -= devValue[seed3];
                cudaNewpopulation[idx].weight -= devWeight[seed3];
            }
            // Change chromo based on a randomly selected chromosome
            cudaNewpopulation[idx].chromo[seed3] = cudaChromo[seed2].chromo[seed3];

            if (cudaNewpopulation[idx].chromo[seed3]) {
                // Increase value and weight if chromo is true after change
                cudaNewpopulation[idx].value += devValue[seed3];
                cudaNewpopulation[idx].weight += devWeight[seed3];
            }
        } else {
            // Perform mutation at the end segment
            bool currentChromo = cudaNewpopulation[idx].chromo[seed3];
            cudaNewpopulation[idx].chromo[seed3] = !currentChromo;

            // Adjust value and weight based on mutation
            int factor = cudaNewpopulation[idx].chromo[seed3] ? 1 : -1;
            cudaNewpopulation[idx].value += devValue[seed3] * factor;
            cudaNewpopulation[idx].weight += devWeight[seed3] * factor;
        }
    }
}