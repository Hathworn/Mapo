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
float *a;
float *aa;
float *aaa;
int aRow;
int aaaRow;
float Dysum[9];

__device__ float c_LB[10];
__device__ float c_UB[10];
__device__ float *c_a;
__device__ float *c_aa;
__device__ float *c_aaa;
__device__ int c_aRow;
__device__ int c_aaaRow;
__device__ float c_Dysum[9];

float bestFitnessOfGen;
int bestIndexOfGen;
float aveFitnessOfGen[maxGeneration];

float fval;
int G;

__global__ void selectPre(float *fitness, float *Fitness, float *tmpFitness, float *populationArray, float *tmpPopulationArray){
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Ensure unique global index
    if (idx < populationSize) { // Boundary check for the population size
        Fitness[idx] = 1.0f / fitness[idx]; // Calculate Fitness value
        tmpFitness[idx] = fitness[idx]; // Copy fitness to tmpFitness
        // Use memcpy for copying chromosome
        memcpy(&tmpPopulationArray[idx * chromosomeSize], &populationArray[idx * chromosomeSize], chromosomeSize * sizeof(float));
    }
}