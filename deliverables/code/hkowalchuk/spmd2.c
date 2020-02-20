/*
 * Filename: Project 2\deliverables\code\hkowalchuk\spmd2.c
 * Path: Project 2\deliverables\code\hkowalchuk
 * Author: Hayden Kowalchuk
 * 
 * Copyright (c) 2020 HaydenKow
 *
 * Usage: ./spmd2 [numThreads]
 *
 * Exercise:
 * - Compile & run with no commandline args
 * - Rerun with different commandline args
 */

#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv) {
  printf("\n");
  if (argc > 1) {
    omp_set_num_threads(atoi(argv[1]));
  }

#pragma omp parallel
  {
    /* Set inside the threaded area in order for each thread to have its own data */
    int id, numThreads;

    id = omp_get_thread_num();
    numThreads = omp_get_num_threads();

    /* Thread id is 0 based, but humans count from 1. */
    /* add 1 to id for the sentence to appear more natural */
    printf("Hello from thread %d of %d\n", id+1, numThreads);
  }

  printf("\n");
  return 0;
}