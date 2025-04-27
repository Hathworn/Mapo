#include "hip/hip_runtime.h"
#include "includes.h"

#define NUMAR_NODURI 500
#define NUMAR_MUCHII 500
#define COST_MAXIM 1000000

typedef struct
{
    int nod1;
    int nod2;
} Muchie;

typedef struct
{
    int nodId;
    bool vizitat;
} Nod;

// Optimize cost update path from start node to stop node
__global__ void UpdateCostDrumuri(Nod *noduri, int *costuriTemporale, int *costuriFinale)
{
    int nod = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread index is within bounds
    if (nod < NUMAR_NODURI) 
    {
        // Use local variable to minimize global memory access
        int costTemp = costuriTemporale[nod];
        
        if (costTemp > costuriFinale[nod])
        {
            costTemp = costuriFinale[nod];
            noduri[nod].vizitat = false;
        }
        
        costuriFinale[nod] = costTemp;
    }
}