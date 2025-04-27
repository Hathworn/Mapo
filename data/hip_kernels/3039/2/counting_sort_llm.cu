#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void counting_sort(int* array, int *temp, int size) {
    int i = threadIdx.x + (blockIdx.x * blockDim.x);
    if (i < size) {
        int count = 0;
        int ai = array[i]; // Load array[i] once
        for(int j = 0; j < size; j++) {
            int aj = array[j]; // Load array[j] once
            if(aj < ai) {
                count++;
            } else if(ai == aj && j < i) {
                count++;
            }
        }
        temp[count] = ai;
    }
}