#include "hip/hip_runtime.h"
#include "includes.h"

#define BOOL int
#define TRUE 1
#define FALSE 0
#define populationSize 128
#define chromosomeSize 10
#define maxGeneration 500
#define crossRate 0.8
#define mutationRate 0.01
#define eliteCount 0.05*populationSize

float LB[10] = {0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5}; //lower bound
float UB[10] = {5, 4, 5, 4, 5, 5, 5, 5, 5, 4}; //upper bound
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

__global__ void initSeed(unsigned int seed, hiprandState_t* states) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Initialize random seed for each state
    if (idx < populationSize) {  // Ensure no out-of-bounds access
        hiprand_init(seed, idx, 0, &states[idx]);
    }
}