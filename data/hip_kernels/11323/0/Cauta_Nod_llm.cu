#include "hip/hip_runtime.h"
#include "includes.h"

#define NUMAR_NODURI 500
#define NUMAR_MUCHII 500
#define COST_MAXIM 1000000

typedef struct {
    int nod1;
    int nod2;
} Muchie;

typedef struct {
    int nodId;
    bool vizitat;
} Nod;

// Finds the cost of the road from start node to stop node
__device__ __host__ int CautareMuchie(Nod start, Nod stop, Muchie *muchii, int *costuri) {
    for (int i = 0; i < NUMAR_MUCHII; i++)
        if (muchii[i].nod1 == start.nodId && muchii[i].nod2 == stop.nodId)
            return costuri[i];

    return COST_MAXIM;
}

__global__ void Cauta_Nod(Nod *noduri, Muchie *muchii, int *costuri, int *costTemporal, int *costFinal) {
    int nod = threadIdx.x;
    
    // Load shared memory once
    __shared__ Nod localNoduri[NUMAR_NODURI];
    if (threadIdx.x < NUMAR_NODURI) {
        localNoduri[threadIdx.x] = noduri[threadIdx.x];
    }
    __syncthreads();
    
    if (!localNoduri[nod].vizitat) {
        localNoduri[nod].vizitat = true;
        for (int n = 0; n < NUMAR_NODURI; n++) {
            // Search for edge cost
            int cost = CautareMuchie(localNoduri[nod], localNoduri[n], muchii, costuri);

            // Use atomicMin to avoid race conditions
            if (cost < COST_MAXIM) {
                atomicMin(&costFinal[n], costTemporal[nod] + cost);
            }
        }
    }
}