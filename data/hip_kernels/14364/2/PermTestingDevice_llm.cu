#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PermTestingDevice(int numPermutations, int N, int V, int N_gp1, double *dataDevice, int *permutationsDevice, double *MaxTDevice)
{
    int threadId = threadIdx.x + (blockIdx.x * blockDim.x); // Current Permutation
    int permutationsStart = threadId * N;
    int N_gp2 = N - N_gp1; // Size of group 2
    double MaxT = 0;
    
    extern __shared__ double sharedMem[]; // Shared memory for voxel data
    double *group1Sums = sharedMem;
    double *group2Sums = &sharedMem[blockDim.x];
    double *group1SumSq = &sharedMem[2 * blockDim.x];
    double *group2SumSq = &sharedMem[3 * blockDim.x];

    for (int i = 0; i < V; i++)
    {
        double group1Sum = 0;
        double group2Sum = 0;
        double group1SumSquared = 0;
        double group2SumSquared = 0;

        // Calculate group 1 statistics
        for (int j = 0; j < N_gp1; j++)
        {
            int currSubject = permutationsDevice[permutationsStart + j] - 1;
            double voxelStatistic = dataDevice[currSubject * V + i];
            group1Sum += voxelStatistic;
            group1SumSquared += voxelStatistic * voxelStatistic;
        }

        // Calculate group 2 statistics
        for (int j = N_gp1; j < N; j++)
        {
            int currSubject = permutationsDevice[permutationsStart + j] - 1;
            double voxelStatistic = dataDevice[currSubject * V + i];
            group2Sum += voxelStatistic;
            group2SumSquared += voxelStatistic * voxelStatistic;
        }

        // Compute means and variances
        double group1Mean = group1Sum / N_gp1;
        double group2Mean = group2Sum / N_gp2;
        double group1Var = (group1SumSquared / N_gp1) - (group1Mean * group1Mean);
        double group2Var = (group2SumSquared / N_gp2) - (group2Mean * group2Mean);

        // Compute t-statistics
        double meanDifference = group1Mean - group2Mean;
        double denominator = sqrt((group1Var / N_gp1) + (group2Var / N_gp2));
        double tStat = meanDifference / denominator;

        // Update maximum t-statistic
        if (tStat > MaxT)
        {
            MaxT = tStat;
        }
    }

    MaxTDevice[threadId] = MaxT;
}