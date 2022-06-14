;;;void quicksort(int *values, int start, int end) {
;;;  if (start < end) {
;;;    int pivot = partition(values, start, end);
;;;    quicksort(values, start, pivot - 1);
;;;    quicksort(values, pivot + 1, end);
;;;  }
;;;}
;;;
;;;static int partition(int *values, int start, int end) {
;;;  int pivot = values[end];
;;;  int i = start - 1;
;;;  for (int j = start; j < end; ++j) {
;;;    if (values[j] <= pivot) {
;;;      i += 1;
;;;      //printf("i: %d, j: %d\n", i, j);
;;;      swap(values, i, j);
;;;      //print_array(values, start, end);
;;;    }
;;;  }
;;;  i += 1;
;;;  //printf("i: %d\n", i);
;;;  swap(values, i, end);
;;;  //print_array(values, start, end);
;;;  return i;
;;;}

section .data
array: db 3, 14, 8, 1, 5, 82, 9, 124
len: equ $ - array        
section .bss
section .text
global quicksort                ; need to define quicksort as entry function
quicksort:
partition:
