#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX 26

int b[1000]; 
unsigned long long tries = 0;
char alphabet[] = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };
size_t result = 1000 * sizeof(float);

int *a = (int *) malloc(result);

__global__ void parallel_passwordCrack(int length, int *d_output, int *a)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    __shared__ int nIter;
    __shared__ int idT;
    __shared__ long totalAttempt;

    int newB[1000] = {0};  // Initialize local array to zero
    bool cracked = false;

    if(idx == 0){
        nIter = 0;
        totalAttempt = 0;
    }
    __syncthreads();  // Ensure shared variables are initialized

    do {
        // Increment the password attempt
        newB[0]++;
        for(int i = 0; i < length; i++){
            if(newB[i] >= 26){
                newB[i] -= 26;
                newB[i+1]++;
            } else {
                break;
            }
        }

        cracked = true;
        for(int k = 0; k < length; k++) {
            if(newB[k] != a[k]){
                cracked = false;
                break;
            }
        }

        // Use __syncthreads to sync threads checking or updating shared data
        __syncthreads(); 

        if(cracked && nIter == 0) {
            idT = idx;
            break;
        } else if(nIter) {
            break;
        }

        if(idx == 0) {
            totalAttempt++;
        }

        __syncthreads();  // Ensure totalAttempt is updated

    } while(!cracked || !nIter);

    if(idx == idT) {
        for(int i = 0; i < length; i++) {
            d_output[i] = newB[i];
        }
    }
}