#include "hip/hip_runtime.h"
#include "includes.h"

#define BOOL int
#define TRUE 1
#define FALSE 0
#define populationSize 128
#define chromosomeSize 10
#define maxGeneration 500
#define crossRate 0.8f
#define mutationRate 0.01f
#define eliteCount (0.05 * populationSize)

float LB[10] = {0.5f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f}; //lower bound
float UB[10] = {5.0f, 4.0f, 5.0f, 4.0f, 5.0f, 5.0f, 5.0f, 5.0f, 5.0f, 4.0f}; //upper bound
float *a;  //Tzaihe
float *aa;  //yingliK
float *aaa; //Tyingli
int aRow;
int aaaRow;
float Dysum[9];

__device__ float c_LB[10]; //lower bound
__device__ float c_UB[10]; //upper bound
__device__ float *c_a;  //Tzaihe
__device__ float *c_aa;  //yingliK
__device__ float *c_aaa; //Tyingli
__device__ int c_aRow;
__device__ int c_aaaRow;
__device__ float c_Dysum[9];

float bestFitnessOfGen; //每一代的最优适应度
int bestIndexOfGen; //每一代的最优适应度位置
float aveFitnessOfGen[maxGeneration]; //每一代的平均最优适应度

float fval; //最终最优适应度
int G; //取得最终最优适应度的迭代次数

__global__ void crossFcn(float *populationArray, hiprandState_t *states) {
    int idx = threadIdx.x;
    hiprandState_t s = states[idx];
    float randVal = hiprand_uniform(&s); // Generate random value once

    if (randVal < crossRate) { // Check if crossover should occur
        int offset = idx * chromosomeSize;
        int offsetMate = (idx + populationSize / 2) * chromosomeSize;
        for (int j = 0; j < chromosomeSize; j++) {
            if ((hiprand(&s) & 1) != 0) { // Randomly decide if genes should be crossed
                // Swap genes
                float tmp = populationArray[offset + j];
                populationArray[offset + j] = populationArray[offsetMate + j];
                populationArray[offsetMate + j] = tmp;
            }
        }
    }
}