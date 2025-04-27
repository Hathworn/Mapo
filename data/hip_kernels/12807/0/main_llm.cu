#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "searchWithCuda_llm.cu"
#include <chrono>
#include <iostream>
using namespace std;
using namespace std::chrono;
int main(int argc, char **argv) {
hipSetDevice(0);

    int XSIZE = 512; 
    int YSIZE = 512;
    int BLOCKX = 16;
    int BLOCKY = 16;

    if (argc > 1) XSIZE = atoi(argv[1]);
    if (argc > 2) YSIZE = atoi(argv[2]);
    if (argc > 3) BLOCKX = atoi(argv[3]);
    if (argc > 4) BLOCKY = atoi(argv[4]);
    double *resultPossibilities = NULL;
hipMalloc(&resultPossibilities, XSIZE*YSIZE);
char *query = NULL;
hipMalloc(&query, XSIZE*YSIZE);
char *atribsValues = NULL;
hipMalloc(&atribsValues, XSIZE*YSIZE);
double *possibilities = NULL;
hipMalloc(&possibilities, XSIZE*YSIZE);
int *queryPrefix = NULL;
hipMalloc(&queryPrefix, XSIZE*YSIZE);
int *atribsPrefix = NULL;
hipMalloc(&atribsPrefix, XSIZE*YSIZE);
int *answersNumber = NULL;
hipMalloc(&answersNumber, XSIZE*YSIZE);
int *categoriesNumber = NULL;
hipMalloc(&categoriesNumber, XSIZE*YSIZE);
int *atribsNumber = NULL;
hipMalloc(&atribsNumber, XSIZE*YSIZE);
int iXSIZE= XSIZE;
int iYSIZE= YSIZE;
while(iXSIZE%BLOCKX!=0) {
iXSIZE++;
}
while(iYSIZE%BLOCKY!=0) {
iYSIZE++;
}
dim3 gridBlock(iXSIZE/BLOCKX, iYSIZE/BLOCKY);
dim3 threadBlock(BLOCKX, BLOCKY);
hipFree(0);
searchWithCuda<<<gridBlock, threadBlock>>>(resultPossibilities,query,atribsValues,possibilities,queryPrefix,atribsPrefix,answersNumber,categoriesNumber,atribsNumber);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
searchWithCuda<<<gridBlock, threadBlock>>>(resultPossibilities,query,atribsValues,possibilities,queryPrefix,atribsPrefix,answersNumber,categoriesNumber,atribsNumber);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
searchWithCuda<<<gridBlock, threadBlock>>>(resultPossibilities,query,atribsValues,possibilities,queryPrefix,atribsPrefix,answersNumber,categoriesNumber,atribsNumber);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}