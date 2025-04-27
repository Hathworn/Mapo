#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_addPhotonsAndBackgroundManyReshuffle_scmos (int n, int sizeSubImage,int numberPSFperModel,double *output, double *input, double *photonAndBackground, double * scmos)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the thread ID is within bounds
    if (id < n)
    {
        // Use integer division and remainder to calculate indices and positions more efficiently
        int idPSF = id / sizeSubImage;
        int idModel = idPSF / numberPSFperModel;
        int idposit = idPSF % numberPSFperModel;
        int idoffset = id % sizeSubImage;

        // Calculate reshuffled index using simplified calculation
        int idreshuffle = idModel * sizeSubImage +
                          idposit * sizeSubImage * (n / (sizeSubImage * numberPSFperModel)) +
                          idoffset;

        // Perform output calculation
        output[idreshuffle] = input[id] * photonAndBackground[idPSF * 2] +
                              photonAndBackground[idPSF * 2 + 1] + scmos[id];
    }
}