#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void extractCoeffs(const float *matrices, float *coeffArray, int savedCoeffs, int dimsize) {
    int threadGlobalID = blockIdx.x * blockDim.x * blockDim.y * blockDim.z
                       + threadIdx.z * blockDim.y * blockDim.x 
                       + threadIdx.y * blockDim.x 
                       + threadIdx.x;

    int offsetMatrix = threadGlobalID * dimsize * dimsize;
    int offsetCoeff = threadGlobalID * savedCoeffs;
    int coeffsLeft = savedCoeffs;
    int x, y, y_n = 0, x_n = 1;
    int numberinrow, tmp;

    coeffArray[offsetCoeff + (savedCoeffs - coeffsLeft)] = matrices[offsetMatrix];
    coeffsLeft -= 1;

    while (coeffsLeft > 0) {
        int x = x_n, y = y_n;
        
        // Calculate number in row
        numberinrow = (x_n < dimsize - 1) ? x_n + 1 : x_n - (y_n - 1);

        // Use conditional statement to handle even and odd rows
        while (numberinrow > 0 && coeffsLeft > 0) {
            coeffArray[offsetCoeff + (savedCoeffs - coeffsLeft)] = matrices[offsetMatrix + x + y * dimsize];
            numberinrow--;
            coeffsLeft--;

            // Efficiently swap x and y for zigzag order
            tmp = x; x = y; y = tmp;

            if (numberinrow % 2 == 0) {
                x--;
                y++;
            }
        }

        // Handle last element in odd row if needed
        if (coeffsLeft > 0 && (x_n >= dimsize - 1 || numberinrow == 0)) {
            coeffArray[offsetCoeff + (savedCoeffs - coeffsLeft)] = matrices[offsetMatrix + x + y * dimsize];
            coeffsLeft--;
        }

        // Move to next diagonal
        if (x_n == dimsize - 1) {
            y_n++;
        } else {
            x_n++;
        }
    }
}