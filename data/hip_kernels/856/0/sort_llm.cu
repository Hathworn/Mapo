#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

__device__ void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

__global__ void sort(int *d_arr, int n, bool isEven) {
    int stride = blockDim.x * 2;
    int start = isEven ? threadIdx.x * 2 : threadIdx.x * 2 + 1;
    // Loop through all elements in the array with step size of stride
    for (int i = start; i < n - 1; i += stride) {
        // Swap elements to sort
        if (d_arr[i] > d_arr[i + 1]) {
            swap(&d_arr[i], &d_arr[i + 1]);
        }
    }
}