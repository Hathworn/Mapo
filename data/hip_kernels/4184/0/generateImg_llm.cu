#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generateImg(unsigned char *data, unsigned char *img, unsigned char *tabDepth, int4 *_tabParents, int i, int tailleTab) {
    int thx = blockIdx.x * blockDim.x + threadIdx.x;
    int thy = blockIdx.y * blockDim.y + threadIdx.y;
    int ThId = thy * tailleTab + thx;
    
    // Early exit if condition not met (avoid unnecessary calculations)
    if (data[ThId] != 0 || tabDepth[ThId] != i || i == 1) {
        return;
    }

    // Reduce memory accesses by using temporary variables
    int4 parents = _tabParents[ThId];
    int nbPar = 0;
    int dataSum = 0;
    
    if (parents.x != -1) { nbPar++; dataSum += data[parents.x]; }
    if (parents.y != -1) { nbPar++; dataSum += data[parents.y]; }
    if (parents.z != -1) { nbPar++; dataSum += data[parents.z]; }
    if (parents.w != -1) { nbPar++; dataSum += data[parents.w]; }
    
    // Ensure nbPar is not zero before division
    if (nbPar > 0) {
        data[ThId] = dataSum / nbPar;
    }
    
    img[ThId] = data[ThId];
}