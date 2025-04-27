#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MakeSplits_Large(int baseAggregateIdx, int* splitting, int* aggregation, int* aggMapAdjIndices, int* aggMapAdjacency, int* adjIndices, int* adjacency) {
    int currentAgg = splitting[blockIdx.x];
    int aggBegin = aggMapAdjIndices[currentAgg];
    int aggSize = aggMapAdjIndices[currentAgg + 1] - aggBegin;
    int newAgg = baseAggregateIdx + blockIdx.x;

    __shared__ int nodeIds[256];
    __shared__ int scratchA[256];
    __shared__ int scratchB[256];
    __shared__ int rootA;
    __shared__ int rootB;
    __shared__ int aCount, bCount;
    __shared__ bool incomplete;

    if (threadIdx.x < aggSize)
        nodeIds[threadIdx.x] = aggMapAdjacency[aggBegin + threadIdx.x];
    __syncthreads();

    // Declare outside if-loop to avoid multiple declarations
    int neighbors[40];
    int nextNeighbor = 0;
    int nodeId = -1;
    if (threadIdx.x < aggSize) {
        nodeId = nodeIds[threadIdx.x];
        int start = adjIndices[nodeId];
        int end = adjIndices[nodeId + 1];

        // Optimize the binary search loop
        for (int i = start; i < end; i++) {
            int neighborId = adjacency[i];
            int lo = 0;
            int hi = aggSize - 1;
            while (lo <= hi) {
                int mid = lo + (hi - lo) / 2;
                if (nodeIds[mid] < neighborId)
                    lo = mid + 1;
                else
                    hi = mid - 1;
            }
            if (lo < aggSize && nodeIds[lo] == neighborId) {
                neighbors[nextNeighbor++] = lo;
            }
        }
    }
    __syncthreads();

    // Initiate distance calculation
    if (threadIdx.x < aggSize) {
        scratchA[threadIdx.x] = (threadIdx.x == 0) ? 0 : -1;
    }

    int myDist = (threadIdx.x == 0) ? 0 : -1;
    bool swapped = false;
    incomplete = true;
    __syncthreads();

    // Optimize the while-loop
    while (incomplete) {
        incomplete = false;
        __syncthreads();

        if (threadIdx.x < aggSize && myDist == -1) {
            for (int i = 0; i < nextNeighbor; i++) {
                int neighborDist = scratchA[neighbors[i]];
                if (neighborDist > -1) myDist = neighborDist + 1;
            }
        }
        __syncthreads();

        if (threadIdx.x < aggSize && myDist > 0 && !swapped) {
            swapped = true;
            scratchA[threadIdx.x] = myDist;
            if (threadIdx.x == 0) rootA = threadIdx.x;
            incomplete = true;
        }
        __syncthreads();
    }

    if (threadIdx.x < aggSize) {
        scratchA[threadIdx.x] = (threadIdx.x == rootA) ? 0 : -1;
    }

    myDist = (threadIdx.x == rootA) ? 0 : -1;
    swapped = false;
    incomplete = true;
    __syncthreads();

    while (incomplete) {
        incomplete = false;
        __syncthreads();

        if (threadIdx.x < aggSize && myDist == -1) {
            for (int i = 0; i < nextNeighbor; i++) {
                int neighborDist = scratchA[neighbors[i]];
                if (neighborDist > -1) myDist = neighborDist + 1;
            }
        }
        __syncthreads();

        if (threadIdx.x < aggSize && myDist > 0 && !swapped) {
            swapped = true;
            scratchA[threadIdx.x] = myDist;
            if (threadIdx.x == rootA) rootB = threadIdx.x;
            incomplete = true;
        }
        __syncthreads();
    }

    int myAggregate = -1;
    if (threadIdx.x == rootA) myAggregate = currentAgg;
    if (threadIdx.x == rootB) myAggregate = newAgg;

    if (threadIdx.x < aggSize) {
        scratchA[threadIdx.x] = myAggregate;
        scratchB[threadIdx.x] = (myAggregate > -1) ? 0 : -1;
    }
    
    incomplete = true;
    __syncthreads();

    while (incomplete) {
        incomplete = false;
        __syncthreads();

        if (threadIdx.x < aggSize && myAggregate == -1) {
            for (int i = 0; i < nextNeighbor; i++) {
                int neighborAgg = scratchA[neighbors[i]];
                if (neighborAgg > -1) {
                    myDist = scratchB[neighbors[i]] + 1;
                    myAggregate = neighborAgg;
                }
            }
            if (myAggregate == -1) incomplete = true;
            if (myAggregate == newAgg) atomicAdd(&bCount, 1);
            if (myAggregate == currentAgg) atomicAdd(&aCount, 1);
        }
        __syncthreads();

        if (threadIdx.x < aggSize) {
            scratchA[threadIdx.x] = myAggregate;
            scratchB[threadIdx.x] = myDist;
        }
        __syncthreads();
    }

    int sizeDifference = abs(aCount - bCount);
    bool moveToA = aCount < bCount;
    __shared__ int moved;
    moved = 0;
    int toMove = sizeDifference / 2;
    incomplete = true;
    __syncthreads();

    while (incomplete && moved < toMove) {
        incomplete = false;
        __syncthreads();
        bool swapping = false;
        int newDist = INT_MAX;
        if (threadIdx.x < aggSize) {
            bool canSwap = (moveToA) ? (myAggregate == newAgg) : (myAggregate == currentAgg);
            bool borderNode = false;

            for (int i = 0; i < nextNeighbor; i++) {
                int neighborAgg = scratchA[neighbors[i]];
                int neighborDist = scratchB[neighbors[i]];
                if (neighborAgg == myAggregate && neighborDist > myDist) canSwap = false;

                if (neighborAgg != myAggregate) {
                    newDist = min(newDist, neighborDist + 1);
                    borderNode = true;
                }
            }

            if (borderNode && canSwap && atomicAdd(&moved, 1) < toMove) {
                swapping = true;
            }
        }
        __syncthreads();
        if (swapping) {
            int a = moveToA ? 1 : -1;
            atomicAdd(&bCount, -a);
            atomicAdd(&aCount, a);
            scratchA[threadIdx.x] = moveToA ? currentAgg : newAgg;
            scratchB[threadIdx.x] = newDist;
            incomplete = true;
        }
        __syncthreads();
    }

    if (threadIdx.x < aggSize) {
        aggregation[nodeId] = scratchA[threadIdx.x];
    }
}